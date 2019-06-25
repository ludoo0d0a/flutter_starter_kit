import 'package:flutter_starter_kit/app/model/pojo/Property.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Entry.g.dart';

@JsonSerializable()
class Entry{


  @JsonKey(name: 'name')
  String imName;
  @JsonKey(name: 'artworkUrl100', includeIfNull: false)
  String imImage;
  @JsonKey(includeIfNull: false)
  String summary;
  @JsonKey(name: 'price', includeIfNull: false)
  String imPrice;
  @JsonKey(name: 'kind', includeIfNull: false)
  String imContentType;
  @JsonKey(includeIfNull: false)
  String title;
  @JsonKey(includeIfNull: false)
  String link;
  String id;
  @JsonKey(name: 'artistName', includeIfNull: false)
  String imArtist;
  @JsonKey(includeIfNull: false)
  String category;
  @JsonKey(name: 'releaseDate', includeIfNull: false)
  String imReleaseDate;


  Entry(this.imName, this.imImage, this.summary, this.imPrice,
      this.imContentType, this.title, this.link, this.id, this.imArtist,
      this.category, this.imReleaseDate);

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);

}