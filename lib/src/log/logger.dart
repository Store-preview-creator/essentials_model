import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

// log.v -> Verbose log
// log.d -> Debug log
// log.i -> Info log
// log.w -> Warning log
// log.e -> Error log
// log.wtf -> What a terrible failure log

class Log {
  static void verbose(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.v(message, error, stackTrace);
  }

  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.d(message, error, stackTrace);
  }

  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.i(message, error, stackTrace);
  }

  static void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.w(message, error, stackTrace);
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.e(message, error, stackTrace);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    log.wtf(message, error, stackTrace);
  }
}
