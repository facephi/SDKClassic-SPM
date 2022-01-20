// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthBody _$AuthBodyFromJson(Map<String, dynamic> json) {
  return AuthBody(
    scope: json['scope'] as String,
    grant_type: json['grant_type'] as String,
  );
}

Map<String, dynamic> _$AuthBodyToJson(AuthBody instance) => <String, dynamic>{
      'scope': instance.scope,
      'grant_type': instance.grant_type,
    };
