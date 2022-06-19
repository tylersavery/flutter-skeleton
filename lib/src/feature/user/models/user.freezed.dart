// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      @JsonKey(defaultValue: "")
          required String uuid,
      String? email,
      @JsonKey(defaultValue: "")
          required String name,
      @JsonKey(defaultValue: "")
          required String username,
      @JsonKey(name: 'phone_number', defaultValue: "")
          required String phoneNumber,
      @JsonKey(defaultValue: "en")
          required String language,
      @JsonKey(name: 'is_email_confirmed', defaultValue: false)
          required bool isEmailConfirmed,
      @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
          required bool isPhoneNumberConfirmed,
      @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
          required bool is2faEnabled,
      DateTime? createdAt,
      String? password}) {
    return _User(
      id: id,
      uuid: uuid,
      email: email,
      name: name,
      username: username,
      phoneNumber: phoneNumber,
      language: language,
      isEmailConfirmed: isEmailConfirmed,
      isPhoneNumberConfirmed: isPhoneNumberConfirmed,
      is2faEnabled: is2faEnabled,
      createdAt: createdAt,
      password: password,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String get uuid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "")
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number', defaultValue: "")
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "en")
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_email_confirmed', defaultValue: false)
  bool get isEmailConfirmed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
  bool get isPhoneNumberConfirmed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
  bool get is2faEnabled => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(defaultValue: "")
          String uuid,
      String? email,
      @JsonKey(defaultValue: "")
          String name,
      @JsonKey(defaultValue: "")
          String username,
      @JsonKey(name: 'phone_number', defaultValue: "")
          String phoneNumber,
      @JsonKey(defaultValue: "en")
          String language,
      @JsonKey(name: 'is_email_confirmed', defaultValue: false)
          bool isEmailConfirmed,
      @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
          bool isPhoneNumberConfirmed,
      @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
          bool is2faEnabled,
      DateTime? createdAt,
      String? password});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? phoneNumber = freezed,
    Object? language = freezed,
    Object? isEmailConfirmed = freezed,
    Object? isPhoneNumberConfirmed = freezed,
    Object? is2faEnabled = freezed,
    Object? createdAt = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      isEmailConfirmed: isEmailConfirmed == freezed
          ? _value.isEmailConfirmed
          : isEmailConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumberConfirmed: isPhoneNumberConfirmed == freezed
          ? _value.isPhoneNumberConfirmed
          : isPhoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      is2faEnabled: is2faEnabled == freezed
          ? _value.is2faEnabled
          : is2faEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(defaultValue: "")
          String uuid,
      String? email,
      @JsonKey(defaultValue: "")
          String name,
      @JsonKey(defaultValue: "")
          String username,
      @JsonKey(name: 'phone_number', defaultValue: "")
          String phoneNumber,
      @JsonKey(defaultValue: "en")
          String language,
      @JsonKey(name: 'is_email_confirmed', defaultValue: false)
          bool isEmailConfirmed,
      @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
          bool isPhoneNumberConfirmed,
      @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
          bool is2faEnabled,
      DateTime? createdAt,
      String? password});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? phoneNumber = freezed,
    Object? language = freezed,
    Object? isEmailConfirmed = freezed,
    Object? isPhoneNumberConfirmed = freezed,
    Object? is2faEnabled = freezed,
    Object? createdAt = freezed,
    Object? password = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: uuid == freezed
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      isEmailConfirmed: isEmailConfirmed == freezed
          ? _value.isEmailConfirmed
          : isEmailConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumberConfirmed: isPhoneNumberConfirmed == freezed
          ? _value.isPhoneNumberConfirmed
          : isPhoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      is2faEnabled: is2faEnabled == freezed
          ? _value.is2faEnabled
          : is2faEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      @JsonKey(defaultValue: "")
          required this.uuid,
      this.email,
      @JsonKey(defaultValue: "")
          required this.name,
      @JsonKey(defaultValue: "")
          required this.username,
      @JsonKey(name: 'phone_number', defaultValue: "")
          required this.phoneNumber,
      @JsonKey(defaultValue: "en")
          required this.language,
      @JsonKey(name: 'is_email_confirmed', defaultValue: false)
          required this.isEmailConfirmed,
      @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
          required this.isPhoneNumberConfirmed,
      @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
          required this.is2faEnabled,
      this.createdAt,
      this.password})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(defaultValue: "")
  final String uuid;
  @override
  final String? email;
  @override
  @JsonKey(defaultValue: "")
  final String name;
  @override
  @JsonKey(defaultValue: "")
  final String username;
  @override
  @JsonKey(name: 'phone_number', defaultValue: "")
  final String phoneNumber;
  @override
  @JsonKey(defaultValue: "en")
  final String language;
  @override
  @JsonKey(name: 'is_email_confirmed', defaultValue: false)
  final bool isEmailConfirmed;
  @override
  @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
  final bool isPhoneNumberConfirmed;
  @override
  @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
  final bool is2faEnabled;
  @override
  final DateTime? createdAt;
  @override
  final String? password;

  @override
  String toString() {
    return 'User(id: $id, uuid: $uuid, email: $email, name: $name, username: $username, phoneNumber: $phoneNumber, language: $language, isEmailConfirmed: $isEmailConfirmed, isPhoneNumberConfirmed: $isPhoneNumberConfirmed, is2faEnabled: $is2faEnabled, createdAt: $createdAt, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality()
                .equals(other.isEmailConfirmed, isEmailConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.isPhoneNumberConfirmed, isPhoneNumberConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.is2faEnabled, is2faEnabled) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(isEmailConfirmed),
      const DeepCollectionEquality().hash(isPhoneNumberConfirmed),
      const DeepCollectionEquality().hash(is2faEnabled),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required int id,
      @JsonKey(defaultValue: "")
          required String uuid,
      String? email,
      @JsonKey(defaultValue: "")
          required String name,
      @JsonKey(defaultValue: "")
          required String username,
      @JsonKey(name: 'phone_number', defaultValue: "")
          required String phoneNumber,
      @JsonKey(defaultValue: "en")
          required String language,
      @JsonKey(name: 'is_email_confirmed', defaultValue: false)
          required bool isEmailConfirmed,
      @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
          required bool isPhoneNumberConfirmed,
      @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
          required bool is2faEnabled,
      DateTime? createdAt,
      String? password}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  @JsonKey(defaultValue: "")
  String get uuid;
  @override
  String? get email;
  @override
  @JsonKey(defaultValue: "")
  String get name;
  @override
  @JsonKey(defaultValue: "")
  String get username;
  @override
  @JsonKey(name: 'phone_number', defaultValue: "")
  String get phoneNumber;
  @override
  @JsonKey(defaultValue: "en")
  String get language;
  @override
  @JsonKey(name: 'is_email_confirmed', defaultValue: false)
  bool get isEmailConfirmed;
  @override
  @JsonKey(name: 'is_phone_number_confirmed', defaultValue: false)
  bool get isPhoneNumberConfirmed;
  @override
  @JsonKey(name: 'is_2fa_enabled', defaultValue: false)
  bool get is2faEnabled;
  @override
  DateTime? get createdAt;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
