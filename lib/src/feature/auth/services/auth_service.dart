import 'package:flutter_skeleton/src/core/app/api_service.dart';
import 'package:flutter_skeleton/src/feature/auth/models/login_result.dart';
import 'package:flutter_skeleton/src/feature/auth/models/token.dart';
import 'package:flutter_skeleton/src/feature/user/models/user.dart';

class AuthService extends ApiService {
  Future<LoginResult?> login({
    required String email,
    String? otpCode,
    String? password,
  }) async {
    if (otpCode == null && password == null) {
      return null;
    }

    final Map<String, dynamic> _params = {
      'email': email,
      ...otpCode != null ? {'otp': otpCode} : {},
      ...password != null ? {'password': password} : {},
    };

    try {
      final response =
          await postHttp('/auth/token', params: _params, auth: false);

      if (response.keys.contains("is_2fa_enabled") &&
          response['is_2fa_enabled'] == true) {
        return const LoginResult(twoFa: true);
      }

      final token = Token.fromJson(response);
      return LoginResult(token: token);
    } catch (e) {
      return null;
    }
  }

  Future<bool> validateLoginCredentials({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> _params = {
      'email': email,
      'password': password,
    };

    try {
      await postHttp('/auth/token', params: _params, auth: false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> register({
    required String email,
    required String username,
    required String password,
    required phoneNumber,
    required name,
  }) async {
    final user = User.register(
      email: email,
      username: username,
      password: password,
      phoneNumber: phoneNumber,
      name: name,
    );

    try {
      final data = await postHttp('/auth/register',
          params: user.serializeForRegister(), auth: false);

      return User.fromJson(data);
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
      final data = await postHttp('/auth/email/validate',
          params: {'email': email}, auth: false);
      return data['is_available'] ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> usernameAvailable(String username) async {
    return true; //TEMP since current BP does not have usernames yet
    // try {
    //  final data = await postHttp('/auth/username/validate',
    //       params: {'username': username}, auth: false);
    //   return data['is_available'] ?? false;
    // } catch (e) {
    //   return false;
    // }
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

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final params = {
        'old_password': oldPassword,
        'new_password': newPassword,
      };

      await postHttp('/auth/password/change', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changeEmail({
    required String email,
  }) async {
    try {
      final params = {
        'email': email,
      };

      await postHttp('/auth/email/change', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> completeEmailChange({
    required String token,
  }) async {
    final params = {
      'token': token,
    };
    try {
      await postHttp('/auth/email/change/complete/', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePhoneNumber({
    required String phoneNumber,
  }) async {
    try {
      final params = {
        'phone_number': phoneNumber,
      };

      await postHttp('/auth/phone-number/change', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> completePhoneNumberChange({
  //   required String token,
  // }) async {
  //   final params = {
  //     'token': token,
  //   };
  //   try {
  //     await postHttp('/auth/phone-number/change/complete/', params: params);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
