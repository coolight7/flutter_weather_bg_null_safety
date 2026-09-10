// ignore_for_file: library_private_types_in_public_api

import 'package:material_ui/material_ui.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_cloud_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_color_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_night_star_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_rain_snow_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_thunder_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

/// 最核心的类，集合背景&雷&雨雪&晴晚&流星效果
/// 1. 支持动态切换大小
/// 2. 支持渐变过度
class WeatherBg extends StatefulWidget {
  final WeatherType weatherType;
  final double width;
  final double height;

  const WeatherBg({
    super.key,
    required this.weatherType,
    required this.width,
    required this.height,
  });

  @override
  _WeatherBgState createState() => _WeatherBgState();
}

class _WeatherBgState extends State<WeatherBg>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var currentBgWidget = WeatherItemBg(
      weatherType: widget.weatherType,
      width: widget.width,
      height: widget.height,
    );
    return SizeInherited(
      size: Size(widget.width, widget.height),
      child: currentBgWidget,
    );
  }
}

class WeatherItemBg extends StatelessWidget {
  final WeatherType weatherType;
  final double width;
  final double height;

  const WeatherItemBg({
    super.key,
    required this.weatherType,
    required this.width,
    required this.height,
  });

  /// 构建晴晚背景效果
  Widget _buildNightStarBg() {
    if (weatherType == WeatherType.sunnyNight) {
      return WeatherNightStarBg(
        weatherType: weatherType,
      );
    }
    return const SizedBox();
  }

  /// 构建雷暴效果
  Widget _buildThunderBg() {
    if (weatherType == WeatherType.thunder) {
      return WeatherThunderBg(
        weatherType: weatherType,
      );
    }
    return const SizedBox();
  }

  /// 构建雨雪背景效果
  Widget _buildRainSnowBg() {
    if (WeatherUtil.isSnowRain(weatherType)) {
      return WeatherRainSnowBg(
        weatherType: weatherType,
        viewWidth: width,
        viewHeight: height,
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRect(
        child: Stack(
          children: [
            WeatherColorBg(
              weatherType: weatherType,
            ),
            WeatherCloudBg(
              weatherType: weatherType,
            ),
            _buildRainSnowBg(),
            _buildThunderBg(),
            _buildNightStarBg(),
          ],
        ),
      ),
    );
  }
}

class SizeInherited extends InheritedWidget {
  final Size size;

  const SizeInherited({
    super.key,
    required super.child,
    required this.size,
  });

  static SizeInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeInherited>();
  }

  @override
  bool updateShouldNotify(SizeInherited oldWidget) {
    return oldWidget.size != size;
  }
}
