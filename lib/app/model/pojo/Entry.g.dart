// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return Entry(
      json['name'] as String,
      json['artworkUrl100'] as String,
      json['summary'] as String,
      json['price'] as String,
      json['kind'] as String,
      json['title'] as String,
      json['link'] as String,
      json['id'] as String,
      json['artistName'] as String,
      json['category'] as String,
      json['releaseDate'] as String);
}

Map<String, dynamic> _$EntryToJson(Entry instance) {
  final val = <String, dynamic>{
    'name': instance.imName,
    'artworkUrl100': instance.imImage,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('summary', instance.summary);
  val['price'] = instance.imPrice;
  val['kind'] = instance.imContentType;
  writeNotNull('title', instance.title);
  writeNotNull('link', instance.link);
  val['id'] = instance.id;
  val['artistName'] = instance.imArtist;
  writeNotNull('category', instance.category);
  val['releaseDate'] = instance.imReleaseDate;
  return val;
}
