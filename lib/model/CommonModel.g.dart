// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) {
  return CommonModel(
      json['status'] as String,
      (json['datas'] as List)
          ?.map((e) =>
              e == null ? null : Datas.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['msg'] as String);
}

Map<String, dynamic> _$CommonModelToJson(CommonModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'datas': instance.datas,
      'msg': instance.msg
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
      json['id'] as String,
      json['uid'] as String,
      json['name'] as String,
      json['title'] as String,
      json['excerpt'] as String,
      json['lead'] as String,
      json['model'] as String,
      json['position'] as String,
      json['thumbnail'] as String,
      json['create_time'] as String,
      json['update_time'] as String,
      (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['status'] as String,
      json['video'] as String,
      json['fm'] as String,
      json['link_url'] as String,
      json['publish_time'] as String,
      json['view'] as String,
      json['share'] as String,
      json['comment'] as String,
      json['good'] as String,
      json['bookmark'] as String,
      json['show_uid'] as String,
      json['fm_play'] as String,
      json['lunar_type'] as String,
      json['hot_comments'] as List,
      json['html5'] as String,
      json['author'] as String,
      json['avatar'] as String,
      json['discover'] as String,
      json['category'] as String);
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'lead': instance.lead,
      'model': instance.model,
      'position': instance.position,
      'thumbnail': instance.thumbnail,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'tags': instance.tags,
      'status': instance.status,
      'video': instance.video,
      'fm': instance.fm,
      'link_url': instance.linkUrl,
      'publish_time': instance.publishTime,
      'view': instance.view,
      'share': instance.share,
      'comment': instance.comment,
      'good': instance.good,
      'bookmark': instance.bookmark,
      'show_uid': instance.showUid,
      'fm_play': instance.fmPlay,
      'lunar_type': instance.lunarType,
      'hot_comments': instance.hotComments,
      'html5': instance.html5,
      'author': instance.author,
      'avatar': instance.avatar,
      'discover': instance.discover,
      'category': instance.category
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(json['name'] as String);
}

Map<String, dynamic> _$TagsToJson(Tags instance) =>
    <String, dynamic>{'name': instance.name};
