import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  String? token; 

  AuthModel({
    this.token
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => 
    _$AuthModelFromJson(json);
    
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

}