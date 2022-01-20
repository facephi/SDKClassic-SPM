// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  AuthResponse({
    required this.access_token,
  });

  final String access_token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);


  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
