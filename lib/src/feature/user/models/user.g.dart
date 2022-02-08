// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      uuid: json['uuid'] as String? ?? '',
      email: json['email'] as String?,
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      language: json['language'] as String? ?? 'en',
      isEmailConfirmed: json['is_email_confirmed'] as bool? ?? false,
      isPhoneNumberConfirmed:
          json['is_phone_number_confirmed'] as bool? ?? false,
      is2faEnabled: json['is_2fa_enabled'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'email': instance.email,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'language': instance.language,
      'is_email_confirmed': instance.isEmailConfirmed,
      'is_phone_number_confirmed': instance.isPhoneNumberConfirmed,
      'is_2fa_enabled': instance.is2faEnabled,
      'createdAt': instance.createdAt?.toIso8601String(),
      'password': instance.password,
    };
