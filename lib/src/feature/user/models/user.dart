import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required int id,
    String? email,
    @JsonKey(name: 'first_name', defaultValue: "") required String firstName,
    @JsonKey(name: 'last_name', defaultValue: "") required String lastName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String get fullName {
    if (firstName.isEmpty && lastName.isEmpty) {
      return "Anonymous";
    }
    return "$firstName $lastName".trim();
  }
}
