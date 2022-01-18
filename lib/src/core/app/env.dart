// ignore_for_file: constant_identifier_names, library_prefixes

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_skeleton/generated/assets.gen.dart';

enum _Environment {
  Develop,
  Production,
}
const _env = _Environment.Develop;

class Env {
  static init() async {
    String? envPath;
    switch (_env) {
      case _Environment.Develop:
        envPath = Assets.env.devEnv;
        break;
      case _Environment.Production:
        envPath = Assets.env.prodEnv;
        break;
    }

    await DotEnv.dotenv.load(fileName: envPath);
  }

  static String get envName {
    return DotEnv.dotenv.env['ENVIRONMENT_NAME'] ?? 'unset';
  }

  static String get storagePrefix {
    return DotEnv.dotenv.env['STORAGE_PREFIX'] ?? 'unset';
  }

  static String get apiBaseUrl {
    return DotEnv.dotenv.env['API_BASE_URL'] ?? 'https://domain.com/api';
  }

  static bool get debug {
    return DotEnv.dotenv.env['DEBUG'] == "true";
  }

  static String get debugLoginEmail {
    if (!debug) return "";
    return DotEnv.dotenv.env['DEBUG_LOGIN_EMAIL'] ?? "";
  }

  static String get debugLoginPassword {
    if (!debug) return "";
    return DotEnv.dotenv.env['DEBUG_LOGIN_PASSWORD'] ?? "";
  }
}
