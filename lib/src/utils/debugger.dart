import 'package:logger/logger.dart';

class Debugger {
  static _logger({int methodCount = 0}) => Logger(
        printer: PrettyPrinter(
          methodCount: methodCount,
        ),
      );

  static log(dynamic message) {
    _logger().i(message);
  }

  static error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger(methodCount: 5).e(message, error, stackTrace);
  }

  static warning(dynamic message) {
    _logger().w(message);
  }
}
