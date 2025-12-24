/// - ListView
///     - ClipRRect : 자녀위젯 그냥 잘라줌
///         - Image
///     - Row (제목행 이라고 부르자!)(TODO 간격 구현하면서 고민!)
///         - Text
///         - Text
///     - Row
///         - Column (큰앨범 이라고 부르자!)
///             - ClipRRect
///                 - Image
///             - Text
///             - Text
///         - 큰앨범
///         - 큰앨범
///     - 제목행
///     - Row (작은앨범 이라고 부르자!)
///         - ClipRRect
///             - Image
///         - Column
///             - Text
///             - Text
///         - Icon
///     - 작은앨범
///     - 작은앨범

import 'package:flutter/material.dart';

// stsateful widget을 배워보자
// 깃 브랜치로 이전 파일들 push 하고 새로 시작
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold();
  }
}

251223 수준별 분반수업
# HTTP 통신

# JSON