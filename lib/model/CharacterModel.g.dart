// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CharacterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return CharacterModel(
      json['status'] as String,
      json['datas'] == null
          ? null
          : Datas.fromJson(json['datas'] as Map<String, dynamic>),
      json['msg'] as String,
      json['code'] as int);
}

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'datas': instance.datas,
      'msg': instance.msg,
      'code': instance.code
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
      json['show_author'] as int,
      (json['list'] as List)
          ?.map((e) =>
              e == null ? null : Lists.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'show_author': instance.showAuthor,
      'list': instance.list
    };

Lists _$ListsFromJson(Map<String, dynamic> json) {
  return Lists(json['id'] as String, json['thumbnail'] as String,
      json['title'] as String, json['sign'] as String);
}

Map<String, dynamic> _$ListsToJson(Lists instance) => <String, dynamic>{
      'id': instance.id,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'sign': instance.sign
    };
