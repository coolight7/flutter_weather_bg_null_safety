import 'package:flutter/foundation.dart';

/// 定义打印函数
typedef WeatherPrint = void Function(
  String message, {
  int wrapWidth,
  String tag,
});

WeatherPrint weatherPrint = debugPrintThrottled;

// 统一方法进行打印
void debugPrintThrottled(
  String message, {
  int? wrapWidth,
  String? tag,
}) {
  if (kDebugMode) {
    debugPrint("flutter-weather: $tag: $message", wrapWidth: wrapWidth);
  }
}
