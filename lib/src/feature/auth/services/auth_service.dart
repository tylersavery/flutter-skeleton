import 'package:flutter_skeleton/src/core/app/api_service.dart';
import 'package:flutter_skeleton/src/feature/auth/models/token.dart';

class AuthService extends ApiService {
  Future<Token?> login(String email, String password) async {
    final _params = {
      'email': email,
      'password': password,
    };

    try {
      final response =
          await postHttp('/auth/token', params: _params, auth: false);
      return Token.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<Token?> refresh(String refreshToken) async {
    final _params = {
      'refresh': refreshToken,
    };

    try {
      final response =
          await postHttp('/auth/token/refresh', params: _params, auth: false);
      return Token.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}
