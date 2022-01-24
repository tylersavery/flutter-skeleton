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

  Future<bool> requestPasswordReset({String? email, String? username}) async {
    if (email == null && username == null) {
      return false;
    }

    try {
      final params = email != null ? {'email': email} : {'username': username};
      await postHttp('/auth/password-reset', params: params, auth: false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> completePasswordReset({
    required String password,
    required String token,
  }) async {
    return true; //TODO: handle this
  }
}
