import 'package:flutter_skeleton/src/core/app/api_service.dart';
import 'package:flutter_skeleton/src/feature/auth/models/token.dart';

class AuthService extends ApiService {
  Future<Token?> login(String email, String password) async {
    final _params = {
      'email': email,
      'password': password,
    };

    await Future.delayed(Duration(seconds: 3));

    try {
      final response =
          await postHttp('/auth/token', params: _params, auth: false);
      return Token.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<Token?> register(
      String email, String username, String password) async {
    final _params = {
      'email': email,
      'username': username,
      'password': password,
    };

    try {
      await postHttp('/auth/register', params: _params, auth: false);
      return await login(email, password);
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

  Future<bool> emailAvailable(String email) async {
    try {
      await getHttp('/auth/email-validate',
          params: {'email': email}, auth: false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> usernameAvailable(String username) async {
    try {
      await getHttp('/auth/username-validate',
          params: {'username': username}, auth: false);
      return true;
    } catch (e) {
      return false;
    }
  }
}
