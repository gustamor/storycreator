import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:story_creator/domain/abstract/logger.dart';

class LogImpl extends LogService {
 @override
  final Logger logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed in stack trace
        errorMethodCount: 8, // Number of method calls if stacktrace is provided for error
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true), // Print the time for each log message
  );

  @override
  void i(dynamic message) {
    logger.i(message);
  }

  @override
  void d(dynamic message) {
    if (kDebugMode) {
      logger.d(message);
    }
  }

  @override
  void e(dynamic message) {
    if (kDebugMode) {
      logger.e(message);
    }
  }
}
