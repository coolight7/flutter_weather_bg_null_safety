import 'package:cupertino_ui/cupertino_ui.dart';

/// 目前有15种天气类型
enum WeatherType {
  heavyRainy,
  heavySnow,
  middleSnow,
  thunder,
  lightRainy,
  lightSnow,
  sunnyNight,
  sunny,
  cloudy,
  cloudyNight,
  middleRainy,
  overcast,
  hazy, // 霾
  foggy, // 雾
  dusty, // 浮尘
}

/// 数据加载状态
enum WeatherDataState {
  /// 初始化
  init,

  /// 正在加载
  loading,

  /// 加载结束
  finish,
}

/// 天气的相关工具类
class WeatherUtil {
  static bool Function() isLightTheme = () {
    return true;
  };

  static bool isSnowRain(WeatherType weatherType) {
    return isRainy(weatherType) || isSnow(weatherType);
  }

  /// 判断是否下雨，小中大包括雷暴，都是属于雨的类型
  static bool isRainy(WeatherType weatherType) {
    return weatherType == WeatherType.lightRainy ||
        weatherType == WeatherType.middleRainy ||
        weatherType == WeatherType.heavyRainy ||
        weatherType == WeatherType.thunder;
  }

  /// 判断是否下雪
  static bool isSnow(WeatherType weatherType) {
    return weatherType == WeatherType.lightSnow ||
        weatherType == WeatherType.middleSnow ||
        weatherType == WeatherType.heavySnow;
  }

  // 根据天气类型获取背景的颜色值
  static List<Color> getColor(WeatherType weatherType) {
    final isLight = isLightTheme.call();
    switch (weatherType) {
      case WeatherType.sunny:
        return const [Color(0xFF0071D1), Color(0xFF6DA6E4)];
      case WeatherType.sunnyNight:
        return const [Color(0xFF061E74), Color(0xFF275E9A)];
      case WeatherType.cloudy:
        return const [
          Color.fromARGB(255, 190, 212, 247),
          Color.fromARGB(255, 219, 224, 232),
        ];
      case WeatherType.cloudyNight:
        return const [
          Color.fromRGBO(55, 71, 86, 1),
          Color.fromARGB(255, 53, 60, 69),
        ];
      case WeatherType.overcast:
        return const [
          Color.fromARGB(255, 199, 220, 252),
          Color.fromARGB(255, 191, 214, 236),
        ];
      case WeatherType.lightRainy:
        if (true == isLight) {
          return const [
            Color.fromARGB(255, 190, 212, 247),
            Color.fromARGB(255, 219, 224, 232),
          ];
        }
        return const [
          Color.fromRGBO(55, 71, 86, 1),
          Color.fromARGB(255, 53, 60, 69),
        ];
      case WeatherType.middleRainy:
        if (isLight) {
          return const [
            Color.fromARGB(255, 206, 221, 242),
            Color.fromARGB(255, 232, 235, 242),
          ];
        }
        return const [
          Color.fromARGB(255, 44, 62, 87),
          Color.fromRGBO(73, 87, 100, 1),
        ];
      case WeatherType.heavyRainy:
      case WeatherType.thunder:
        if (isLight) {
          return const [
            Color.fromARGB(255, 240, 244, 255),
            Color.fromARGB(255, 219, 223, 232),
          ];
        }
        return const [
          Color.fromRGBO(59, 67, 78, 1),
          Color.fromRGBO(86, 93, 102, 1),
        ];
      case WeatherType.hazy:
        return const [Color(0xFF989898), Color(0xFF4B4B4B)];
      case WeatherType.foggy:
        return const [Color(0xFFA6B3C2), Color(0xFF737F88)];
      case WeatherType.lightSnow:
        if (isLight) {
          return const [
            Color.fromARGB(255, 193, 210, 236),
            Color.fromARGB(255, 229, 237, 248),
          ];
        }
        return const [
          Color.fromRGBO(55, 71, 86, 1),
          Color.fromARGB(255, 53, 60, 69),
        ];
      case WeatherType.middleSnow:
        if (isLight) {
          return const [
            Color.fromARGB(255, 206, 221, 242),
            Color.fromARGB(255, 232, 235, 242),
          ];
        }
        return const [
          Color.fromARGB(255, 44, 62, 87),
          Color.fromRGBO(73, 87, 100, 1),
        ];
      case WeatherType.heavySnow:
        if (true == isLight) {
          return const [
            Color.fromARGB(255, 240, 244, 255),
            Color.fromARGB(255, 219, 223, 232),
          ];
        }
        return const [
          Color.fromRGBO(55, 71, 86, 1),
          Color.fromARGB(255, 53, 60, 69),
        ];
      case WeatherType.dusty:
        return const [Color(0xFFB99D79), Color(0xFF6C5635)];
      default:
        return const [Color(0xFF0071D1), Color(0xFF6DA6E4)];
    }
  }

  // 根据天气类型获取天气的描述信息
  static String getWeatherDesc(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.sunny:
      case WeatherType.sunnyNight:
        return "晴";
      case WeatherType.cloudy:
      case WeatherType.cloudyNight:
        return "多云";
      case WeatherType.overcast:
        return "阴";
      case WeatherType.lightRainy:
        return "小雨";
      case WeatherType.middleRainy:
        return "中雨";
      case WeatherType.heavyRainy:
        return "大雨";
      case WeatherType.thunder:
        return "雷阵雨";
      case WeatherType.hazy:
        return "雾";
      case WeatherType.foggy:
        return "霾";
      case WeatherType.lightSnow:
        return "小雪";
      case WeatherType.middleSnow:
        return "中雪";
      case WeatherType.heavySnow:
        return "大雪";
      case WeatherType.dusty:
        return "浮尘";
      default:
        return "晴";
    }
  }
}
