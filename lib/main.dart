// 색상을 관리하는 뷰모델 만들기 사용방법. 코드만들 때 참고용으로 쓸 수 있는 치트시트
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorState {
  Color color;
  ColorState(this.color);
}

class ColorViewModel extends Notifier<ColorState> {
  @override
  ColorState build() {
    return ColorState(Colors.yellow);
  }
}

// Notifier는 똑같음
// AutoDisposeNotifier
final ColorViewModelProvider = NotifierProvider<ColorViewModel, ColorState>(() {
  return ColorViewModel();
});

final ColorViewModelProvider2 = NotifierProvider<ColorViewModel, ColorState>(
  () {
    return ColorViewModel();
  },
  isAutoDispose: true,
);

// familyNotifier
class ColorViewModel2 extends Notifier<ColorState> {
  final String pageName;
  ColorViewModel2(this.pageName);

  @override
  ColorState build() {
    return ColorState(Colors.yellow);
  }
}

// familyNotifier
final colorsViewProvider3 =
    NotifierProvider.family<ColorViewModel2, ColorState, String>(
      (String arg) {
        return ColorViewModel2(arg);
      },
      isAutoDispose: true,
      //
    );
