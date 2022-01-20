// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
part 'auth_body.g.dart';

@JsonSerializable()
class AuthBody {
  AuthBody({
    required this.scope,
    required this.grant_type,
  });

  final String scope;
  final String grant_type;

  factory AuthBody.fromJson(Map<String, dynamic> json) => _$AuthBodyFromJson(json);


  Map<String, dynamic> toJson() => _$AuthBodyToJson(this);
}
