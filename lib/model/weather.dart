// _가 있는 경우 클릭하고 커맨드+P Transform to camelCase 대문자로 변경됨

import 'package:flutter_practice_1/model/current_weather.dart';
import 'package:flutter_practice_1/model/weather_units.dart';

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
