// _가 있는 경우 클릭하고 커맨드+P Transform to camelCase 대문자로 변경됨

/// Open-Meteo API 등에서 제공하는 날씨 응답 데이터를 담는 메인 클래스입니다.
class Weather {
  /// 데이터가 조회된 지점의 위도 (Latitude)
  final double latitude;

  /// 데이터가 조회된 지점의 경도 (Longitude)
  final double longitude;

  /// 서버에서 응답 데이터를 생성하는 데 걸린 시간 (ms)
  final double generationtimeMs;

  /// UTC 기준 시간 오차 (초 단위)
  final int utcOffsetSeconds;

  /// 해당 지역의 시간대 정보 (예: GMT)
  final String timezone;

  /// 시간대 약어
  final String timezoneAbbreviation;

  /// 해당 지점의 해발 고도 (단위: m)
  final double elevation;

  /// 현재 시점의 실시간 기상 수치 데이터
  final CurrentWeather currentWeather;

  /// 기상 수치들에 사용된 단위 정보 (예: °C, km/h)
  final WeatherUnits currentWeatherUnits;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeather,
    required this.currentWeatherUnits,
  });

  /// JSON Map 데이터를 [Weather] 인스턴스로 변환하는 Named Constructor입니다.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
      currentWeatherUnits: WeatherUnits.fromJson(json['current_weather_units']),
    );
  }
}

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
