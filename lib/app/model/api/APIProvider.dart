import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_starter_kit/app/model/pojo/response/LookupResponse.dart';
import 'package:flutter_starter_kit/app/model/pojo/response/TopAppResponse.dart';
import 'package:flutter_starter_kit/config/Env.dart';
import 'package:flutter_starter_kit/utility/http/HttpException.dart';
import 'package:flutter_starter_kit/utility/log/DioLogger.dart';
import 'package:flutter_starter_kit/utility/log/Log.dart';
import 'package:sprintf/sprintf.dart';

class APIProvider{
  static const String TAG = 'APIProvider';

//  https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json
//  https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/10/explicit.json

//  static const String _baseUrl = 'https://itunes.apple.com/hk';
  static const String _baseUrl = 'https://rss.itunes.apple.com/api/v1/us/ios-apps';
//  static const String _TOP_FREE_APP_API = '/rss/topfreeapplications/limit=%d/json';
  static const String _TOP_FREE_APP_API = '/top-free/all/%d/explicit.json';
  static const String _TOP_FEATURE_APP_API = '/top-grossing/all/%d/explicit.json';
//  static const String _TOP_FEATURE_APP_API = '/rss/topgrossingapplications/limit=%d/json';

  static const String _baseUrl2 = 'https://itunes.apple.com';
  static const String _APP_DETAIL_API = '/lookup';
//  static const String _APP_DETAIL_API = '/lookup/json';
  // https://itunes.apple.com/lookup?id=APPID

  Dio _dio;
  Dio _dio2;

  APIProvider(){
    BaseOptions dioOptions = BaseOptions()
      ..baseUrl = APIProvider._baseUrl;
    _dio = Dio(dioOptions);

    BaseOptions dioOptions2 = BaseOptions()
      ..baseUrl = APIProvider._baseUrl2;
    _dio2 = Dio(dioOptions2);

    if(EnvType.DEVELOPMENT == Env.value.environmentType || EnvType.STAGING == Env.value.environmentType){

      _dio.interceptors.add(InterceptorsWrapper(
          onRequest:(RequestOptions options) async{
            DioLogger.onSend(TAG, options);
            return options;
          },
          onResponse: (Response response){
            DioLogger.onSuccess(TAG, response);
            return response;
          },
          onError: (DioError error){
            DioLogger.onError(TAG, error);
            return error;
          }
      ));
    }
  }

  Future<TopAppResponse> getTopFreeApp(int limit) async{
    Response response = await _dio.get(sprintf(APIProvider._TOP_FREE_APP_API, [limit]));
    throwIfNoSuccess(response);
    return TopAppResponse.fromJson(response.data);
//    return TopAppResponse.fromJson(jsonDecode(response.data));
  }

  Future<TopAppResponse> getTopFeatureApp(int limit) async{
    Response response = await _dio.get(sprintf(APIProvider._TOP_FEATURE_APP_API, [limit]));
    throwIfNoSuccess(response);
    return TopAppResponse.fromJson(response.data);
//    return TopAppResponse.fromJson(jsonDecode(response.data));
  }

  Future<LookupResponse> getAppDetail(String id) async{
    Response response = await _dio2.get(APIProvider._APP_DETAIL_API, queryParameters:{'id':id});
    throwIfNoSuccess(response);
    return LookupResponse.fromJson(jsonDecode(response.data));
  }

  void throwIfNoSuccess(Response response) {
    if(response.statusCode < 200 || response.statusCode > 299) {
      throw new HttpException(response);
    }
  }

}