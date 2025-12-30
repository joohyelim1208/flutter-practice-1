import 'package:flutter/material.dart';

/// Open-Meteo API 등에서 제공하는 전체 기상 데이터를 관리하는 메인 클래스입니다.
class Weather {
  /// 데이터가 조회된 지점의 위도 (Latitude)
  final double latitude;

  /// 데이터가 조회된 지점의 경도 (Longitude)
  final double longitude;

  /// API 응답에 걸린 생성 시간 (milliseconds)
  final double generationtimeMs;

  /// UTC 기준 시간 오차 (초 단위)
  final int utcOffsetSeconds;

  /// 해당 지역의 시간대 정보 (예: GMT)
  final String timezone;

  /// 시간대 약어
  final String timezoneAbbreviation;

  /// 해당 지점의 해발 고도 (단위: m)
  final double elevation;

  /// 현재 시점의 구체적인 날씨 수치 데이터
  final CurrentWeather currentWeather;

  /// 날씨 수치들에 사용된 단위 정보 (예: °C, km/h)
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

  /// JSON Map 데이터를 Weather 객체 인스턴스로 변환하는 생성자입니다.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: (json['elevation'] as num).toDouble(),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
      currentWeatherUnits: WeatherUnits.fromJson(json['current_weather_units']),
    );
  }
}

/// 현재 시점의 기온, 풍속 등 실시간 기상 수치를 담는 클래스입니다.
class CurrentWeather {
  /// 데이터 측정 시간 (ISO8601 형식 문자열)
  final String time;

  /// 데이터 업데이트 주기 (초 단위)
  final int interval;

  /// 현재 기온
  final double temperature;

  /// 현재 풍속
  final double windspeed;

  /// 풍향 (0~360도 도표 기준)
  final int winddirection;

  /// 낮/밤 구분 (1: 낮, 0: 밤)
  final int isDay;

  /// WMO 기준 기상 상태 코드 (0: 맑음, 1~3: 구름 등)
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
      time: json['time'],
      interval: json['interval'],
      temperature: (json['temperature'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }
}

/// 날씨 데이터 출력 시 사용할 단위(Unit) 정보를 정의하는 클래스입니다.
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
      time: json['time'],
      temperature: json['temperature'],
      windspeed: json['windspeed'],
      winddirection: json['winddirection'],
      weathercode: json['weathercode'],
    );
  }
}
