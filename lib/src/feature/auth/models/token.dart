// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_skeleton/src/core/app/singletons.dart';
import 'package:flutter_skeleton/src/core/app/storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Token {
  static const AUTH_TOKEN_KEY = "AUTH_TOKEN";

  String access;
  String refresh;
  bool twoFA;

  Token({
    required this.access,
    required this.refresh,
    this.twoFA = false,
  });

  factory Token.fromJson(json) {
    return Token(access: json['access'], refresh: json['refresh']);
  }

  factory Token.empty() {
    return Token(access: "", refresh: "");
  }
  factory Token.twoFA() {
    return Token(access: "", refresh: "", twoFA: true);
  }

  factory Token.fromStorage() {
    final tokenString = singleton<Storage>().getString(Token.AUTH_TOKEN_KEY);
    if (tokenString != null) {
      return Token.fromJson(jsonDecode(tokenString));
    }
    return Token.empty();
  }

  // private
  Map<String, dynamic> _decode(string) {
    return JwtDecoder.decode(string);
  }

  bool _isExpired(string) {
    return JwtDecoder.isExpired(string);
  }

  DateTime _getExpirationDate(string) {
    return JwtDecoder.getExpirationDate(string);
  }

  String toJson() {
    return jsonEncode({
      'access': access,
      'refresh': refresh,
    });
  }

  // decoding
  Map<String, dynamic> decodeAccessToken() {
    return _decode(access);
  }

  Map<String, dynamic> decodeRefreshToken() {
    return _decode(refresh);
  }

  // expiry checks
  bool accessTokenIsExpired() {
    return _isExpired(access);
  }

  bool refreshTokenIsExpired() {
    return _isExpired(refresh);
  }

  // expiry dates
  DateTime accessTokenExpiresAt() {
    return _getExpirationDate(access);
  }

  DateTime refreshTokenExpiresAt() {
    return _getExpirationDate(refresh);
  }

  // access expiry
  int secondsUntilExpiry() {
    DateTime expiresAt = accessTokenExpiresAt();
    return expiresAt.difference(DateTime.now()).inSeconds;
  }
}
