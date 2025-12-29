import 'package:flutter/material.dart';

// 파일을 메인에서 분리해주었다.
class MyTextBox extends StatelessWidget {
  // 생성자
  MyTextBox({required this.text}) {
    print("생성자 호출함 : $text");
  }
  String text;

  @override
  Widget build(BuildContext context) {
    print("빌드 메서드 호출됨 : $text");
    // 메서드
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: Colors.amber),
      margin: EdgeInsets.all(5),
      child: Center(child: Text(text)),
    );
  }
}
