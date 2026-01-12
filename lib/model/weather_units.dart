// _가 있는 경우 클릭하고 커맨드+P Transform to camelCase 대문자로 변경됨

/// 날씨 데이터 출력 시 뒤에 붙을 단위(Unit) 정보를 관리하는 클래스입니다.
class WeatherUnits {
  /// 시간 표시 형식 (예: "iso8601")
  final String time;

  /// 기온 단위 (예: "°C")
  final String temperature;

  /// 풍속 단위 (예: "km/h")
  final String windspeed;

  /// 풍향 단위 (예: "°")
  final String winddirection;

  /// 기상 코드 레이블 (예: "wmo code")
  final String weathercode;

  WeatherUnits({
    required this.time,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
  });

  factory WeatherUnits.fromJson(Map<String, dynamic> json) {
    return WeatherUnits(
      time: json['time'] as String,
      temperature: json['temperature'] as String,
      windspeed: json['windspeed'] as String,
      winddirection: json['winddirection'] as String,
      weathercode: json['weathercode'] as String,
    );
  }
}
