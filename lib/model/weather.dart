import 'package:freezed_annotation/freezed_annotation.dart';
import 'current_weather_units.dart';
import 'current_weather.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required double latitude,
    required double longitude,
    @JsonKey(name: 'generationtime_ms') required double generationtimeMs,
    @JsonKey(name: 'utc_offset_seconds') required int utcOffsetSeconds,
    required String timezone,
    @JsonKey(name: 'timezone_abbreviation')
    required String timezoneAbbreviation,
    required double elevation,
    @JsonKey(name: 'current_weather_units')
    required CurrentWeatherUnits currentWeatherUnits,
    @JsonKey(name: 'current_weather') required CurrentWeather currentWeather,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
