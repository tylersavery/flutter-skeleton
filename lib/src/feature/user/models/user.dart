import 'package:flutter_skeleton/src/utils/strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required int id,
    @JsonKey(defaultValue: "") required String uuid,
    String? email,
    @JsonKey(defaultValue: "") required String name,
    @JsonKey(name: 'phone_number', defaultValue: "")
        required String phoneNumber,
    @JsonKey(defaultValue: "en") required String language,
    @JsonKey(name: 'is_email_confirmed', defaultValue: false)
        required bool isEmailConfirmed,
    @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
        required bool isPhoneNumberConfirmed,
    @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
        required bool is2faEnabled,
    DateTime? createdAt,
    String? password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.register({
    required String email,
    required String username,
    required String password,
    required String phoneNumber,
    required String name,
  }) {
    final json = {
      'email': email,
      'password': password,
      'name': name,
      'username': username,
      'phone_number': normalizePhoneNumber(phoneNumber)
    };

    return _$UserFromJson(json);
  }

  Map<String, dynamic> serializeForRegister() {
    return {
      'email': email,
      'password': password,
      'phone_number': normalizePhoneNumber(phoneNumber),
      'name': name,
      // 'username': username,
    };
  }
}
