import 'package:json_annotation/json_annotation.dart';

part 'CharacterModel.g.dart';


@JsonSerializable()
class CharacterModel{

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'datas')
  Datas datas;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  int code;

  CharacterModel(this.status,this.datas,this.msg,this.code,);

  factory CharacterModel.fromJson(Map<String, dynamic> srcJson) => _$CharacterModelFromJson(srcJson);

}


@JsonSerializable()
class Datas{

  @JsonKey(name: 'show_author')
  int showAuthor;

  @JsonKey(name: 'list')
  List<Lists> list;

  Datas(this.showAuthor,this.list,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

}


@JsonSerializable()
class Lists{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'sign')
  String sign;

  Lists(this.id,this.thumbnail,this.title,this.sign,);

  factory Lists.fromJson(Map<String, dynamic> srcJson) => _$ListsFromJson(srcJson);

}


