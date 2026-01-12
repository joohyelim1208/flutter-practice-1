import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

@freezed
abstract class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    required String time,
    required int interval,
    required double temperature,
    required double windspeed,
    required int winddirection,
    // 원본 제이슨은 스네이크 키를 받는걸 알려줌!
    @JsonKey(name: "is_day") required int isDay,
    required int weathercode,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}
