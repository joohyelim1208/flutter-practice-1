import 'package:flutter/material.dart';
import 'package:flutter_practice_1/home_view_model.dart';
import 'package:flutter_practice_1/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/framework.dart';

// ConsumerWidget 이란?
class Temp extends ConsumerWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef ref: 뷰모델을 관리하는 객체에게 상태 혹은 뷰모델 달라고 요청할 수 있는 기능을 제공함!
    // 상태 가지고 오기
    // watch메서드는 즉각 상태가 바뀌었을 때 보여주는 것, read는 한번만 보여주는 것(null이 뜬다)
    // 상태가 바뀌면 그때 UI가 바뀜. 기존에는 setState()를 통해 확인했는데
    HomeState state = ref.watch(homeViewModelProvider);
    Weather? weather = state.weather;
    return Text(
      "${weather?.currentWeather.temperature} ${weather?.currentWeatherUnits.temperature}",
      style: TextStyle(fontSize: 36),
    );
  }
}
