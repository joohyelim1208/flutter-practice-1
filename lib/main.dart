import 'package:flutter/material.dart';
import 'package:flutter_practice_1/plus_one.dart';

// stsateful widget을 배워보자
// 깃 브랜치로 이전 파일들 push 하고 새로 시작
// 숫자를 올리고 내리는 앱을 만들어보자
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      home: HomePage(),
    );
  }
}

// 4)StatelessWidget 이면 화면이 안바뀜
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 2)버튼을 누르면 숫자가 올라가게 하기. 변수값을 주고
  int number = 0;
  // 변수 타입, 변수명으로 넘겨줌
  // void Function() plusNumber = () {}
  // 위 문법이랑 같음!
  // 함수를 변수처럼 파라미터로 전달 가능하다!!
  void plusNumber() {
    number++;
    setState(() {});
  }

  @override
  Widget build(Object context) {
    // 6) 한번만 됨
    print("build 메서드 호출됨");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 위에 변수주고 꼭 변수명 가져오기!!!
          Text("$number", style: TextStyle(fontSize: 100)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1)컨테이너를 위젯으로 감싸줌 버튼만들기
              // 8) GestureDetector 위젯으로 만들고 파일로 빼줌!
              // 10) plusClick가져옴
              PlusOne(plusClick: plusNumber),
              PlusOne(plusClick: plusNumber),
              // 12) 복붙
              /*
              PlusOne(
                plusClick: () {
                  number++;
                  setState(() {});     
                },   
              ),
              */
            ],
          ),
        ],
      ),
    );
  }
}
