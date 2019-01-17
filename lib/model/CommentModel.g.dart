// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
      json['status'] as String,
      json['datas'] == null
          ? null
          : Datas.fromJson(json['datas'] as Map<String, dynamic>),
      json['msg'] as String,
      json['code'] as int);
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'datas': instance.datas,
      'msg': instance.msg,
      'code': instance.code
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
      json['comment'] == null
          ? null
          : Comment.fromJson(json['comment'] as Map<String, dynamic>),
      (json['digg'] as List)
          ?.map((e) =>
              e == null ? null : Digg.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DatasToJson(Datas instance) =>
    <String, dynamic>{'comment': instance.comment, 'digg': instance.digg};

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
      (json['news'] as List)
          ?.map((e) =>
              e == null ? null : News.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['hots'] as List)
          ?.map((e) =>
              e == null ? null : Hots.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['count'] == null
          ? null
          : Count.fromJson(json['count'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'news': instance.news,
      'hots': instance.hots,
      'count': instance.count
    };

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['id'] as String,
      json['pid'] as String,
      json['uid'] as String,
      json['content'] as String,
      json['post_id'] as String,
      json['update_time'] as String,
      json['good'] as String,
      json['model'] as String,
      json['to_author_name'] as String,
      json['under_id'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
      json['child'] as List);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'pid': instance.pid,
      'uid': instance.uid,
      'content': instance.content,
      'post_id': instance.postId,
      'update_time': instance.updateTime,
      'good': instance.good,
      'model': instance.model,
      'to_author_name': instance.toAuthorName,
      'under_id': instance.underId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'child': instance.child
    };

Hots _$HotsFromJson(Map<String, dynamic> json) {
  return Hots(
      json['id'] as String,
      json['pid'] as String,
      json['uid'] as String,
      json['content'] as String,
      json['post_id'] as String,
      json['update_time'] as String,
      json['good'] as String,
      json['model'] as String,
      json['to_author_name'] as String,
      json['under_id'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
      json['child'] as List);
}

Map<String, dynamic> _$HotsToJson(Hots instance) => <String, dynamic>{
      'id': instance.id,
      'pid': instance.pid,
      'uid': instance.uid,
      'content': instance.content,
      'post_id': instance.postId,
      'update_time': instance.updateTime,
      'good': instance.good,
      'model': instance.model,
      'to_author_name': instance.toAuthorName,
      'under_id': instance.underId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'child': instance.child
    };

Count _$CountFromJson(Map<String, dynamic> json) {
  return Count(json['hots'] as int, json['news'] as int);
}

Map<String, dynamic> _$CountToJson(Count instance) =>
    <String, dynamic>{'hots': instance.hots, 'news': instance.news};

Digg _$DiggFromJson(Map<String, dynamic> json) {
  return Digg(json['uid'] as String, json['avatar'] as String);
}

Map<String, dynamic> _$DiggToJson(Digg instance) =>
    <String, dynamic>{'uid': instance.uid, 'avatar': instance.avatar};
