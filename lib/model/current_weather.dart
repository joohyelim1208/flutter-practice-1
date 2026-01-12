// _가 있는 경우 클릭하고 커맨드+P Transform to camelCase 대문자로 변경됨

/// 현재 시점의 기온, 풍속 등 실시간 기상 수치를 관리하는 클래스입니다.
class CurrentWeather {
  /// 데이터 측정 시간 (ISO8601 형식 문자열)
  final String time;

  /// 데이터 업데이트 주기 (초 단위)
  final int interval;

  /// 현재 기온 (Celsius 등)
  final double temperature;

  /// 현재 풍속 (km/h 등)
  final double windspeed;

  /// 풍향 (0~360도 도표 기준)
  final int winddirection;

  /// 낮/밤 구분 (1: 낮, 0: 밤)
  final int isDay;

  /// WMO 기준 기상 상태 코드 (예: 0은 맑음)
  final int weathercode;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'] as String,
      interval: json['interval'] as int,
      temperature: (json['temperature'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddirection: json['winddirection'] as int,
      isDay: json['is_day'] as int,
      weathercode: json['weathercode'] as int,
    );
  }
}
