import 'package:json_annotation/json_annotation.dart';
part 'CommonModel.g.dart';

@JsonSerializable()
class CommonModel {

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  @JsonKey(name: 'msg')
  String msg;

//  @JsonKey(name: 'code')
//  int code;

  CommonModel(this.status,this.datas,this.msg,);

  factory CommonModel.fromJson(Map<String, dynamic> srcJson) => _$CommonModelFromJson(srcJson);

}


@JsonSerializable()
class Datas {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'excerpt')
  String excerpt;

  @JsonKey(name: 'lead')
  String lead;

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'position')
  String position;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  @JsonKey(name: 'create_time')
  String createTime;

  @JsonKey(name: 'update_time')
  String updateTime;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'video')
  String video;

  @JsonKey(name: 'fm')
  String fm;

  @JsonKey(name: 'link_url')
  String linkUrl;

  @JsonKey(name: 'publish_time')
  String publishTime;

  @JsonKey(name: 'view')
  String view;

  @JsonKey(name: 'share')
  String share;

  @JsonKey(name: 'comment')
  String comment;

  @JsonKey(name: 'good')
  String good;

  @JsonKey(name: 'bookmark')
  String bookmark;

  @JsonKey(name: 'show_uid')
  String showUid;

  @JsonKey(name: 'fm_play')
  String fmPlay;

  @JsonKey(name: 'lunar_type')
  String lunarType;

  @JsonKey(name: 'hot_comments')
  List<dynamic> hotComments;

  @JsonKey(name: 'html5')
  String html5;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'discover')
  String discover;

  @JsonKey(name: 'category')
  String category;

  Datas(this.id,this.uid,this.name,this.title,this.excerpt,this.lead,this.model,this.position,this.thumbnail,this.createTime,this.updateTime,this.tags,this.status,this.video,this.fm,this.linkUrl,this.publishTime,this.view,this.share,this.comment,this.good,this.bookmark,this.showUid,this.fmPlay,this.lunarType,this.hotComments,this.html5,this.author,this.avatar,this.discover,this.category,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

}


@JsonSerializable()
class Tags{

  @JsonKey(name: 'name')
  String name;

  Tags(this.name,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

}

