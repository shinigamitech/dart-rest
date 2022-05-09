// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      firstName: json['first-name'] as String,
      id: json['id'] as String,
      lastName: json['last-name'] as String,
      pictureUrl: json['picture-url'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first-name': instance.firstName,
      'last-name': instance.lastName,
      'picture-url': instance.pictureUrl,
    };
