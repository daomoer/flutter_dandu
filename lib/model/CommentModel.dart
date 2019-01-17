import 'package:json_annotation/json_annotation.dart';

part 'CommentModel.g.dart';


@JsonSerializable()
class CommentModel{

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'datas')
  Datas datas;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  int code;

  CommentModel(this.status,this.datas,this.msg,this.code,);

  factory CommentModel.fromJson(Map<String, dynamic> srcJson) => _$CommentModelFromJson(srcJson);

}


@JsonSerializable()
class Datas{

  @JsonKey(name: 'comment')
  Comment comment;

  @JsonKey(name: 'digg')
  List<Digg> digg;

  Datas(this.comment,this.digg,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

}


@JsonSerializable()
class Comment{

  @JsonKey(name: 'news')
  List<News> news;

  @JsonKey(name: 'hots')
  List<Hots> hots;

  @JsonKey(name: 'count')
  Count count;

  Comment(this.news,this.hots,this.count,);

  factory Comment.fromJson(Map<String, dynamic> srcJson) => _$CommentFromJson(srcJson);

}


@JsonSerializable()
class News{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'pid')
  String pid;

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'post_id')
  String postId;

  @JsonKey(name: 'update_time')
  String updateTime;

  @JsonKey(name: 'good')
  String good;

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'to_author_name')
  String toAuthorName;

  @JsonKey(name: 'under_id')
  String underId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'child')
  List<dynamic> child;

  News(this.id,this.pid,this.uid,this.content,this.postId,this.updateTime,this.good,this.model,this.toAuthorName,this.underId,this.nickname,this.avatar,this.child,);

  factory News.fromJson(Map<String, dynamic> srcJson) => _$NewsFromJson(srcJson);

}


@JsonSerializable()
class Hots{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'pid')
  String pid;

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'post_id')
  String postId;

  @JsonKey(name: 'update_time')
  String updateTime;

  @JsonKey(name: 'good')
  String good;

  @JsonKey(name: 'model')
  String model;

  @JsonKey(name: 'to_author_name')
  String toAuthorName;

  @JsonKey(name: 'under_id')
  String underId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'child')
  List<dynamic> child;

  Hots(this.id,this.pid,this.uid,this.content,this.postId,this.updateTime,this.good,this.model,this.toAuthorName,this.underId,this.nickname,this.avatar,this.child,);

  factory Hots.fromJson(Map<String, dynamic> srcJson) => _$HotsFromJson(srcJson);

}


@JsonSerializable()
class Count{

  @JsonKey(name: 'hots')
  int hots;

  @JsonKey(name: 'news')
  int news;

  Count(this.hots,this.news,);

  factory Count.fromJson(Map<String, dynamic> srcJson) => _$CountFromJson(srcJson);

}


@JsonSerializable()
class Digg{

  @JsonKey(name: 'uid')
  String uid;

  @JsonKey(name: 'avatar')
  String avatar;

  Digg(this.uid,this.avatar,);

  factory Digg.fromJson(Map<String, dynamic> srcJson) => _$DiggFromJson(srcJson);

}


