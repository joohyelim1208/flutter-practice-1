import 'package:flutter/material.dart';
import 'package:flutter_practice_1/My_text_box.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
    //
  }
}

// 화면을 스크롤 가능하게 만드는
// SingleChildScrollView + Column
// ListView 기본 생성자
// ListView.builder 네임드 생성자
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 일일히 100개를 다 적는건 비효율적이라 반복문을 이용해준다.
    /*
    List<Widget> children = [];
    for (var i = 0; i < 100; i++) {
      children.add(MyTextBox(text: "$i번째 박스"));
    }
    */

    return Scaffold(
      appBar: AppBar(title: Text("리스트뷰 스터디")),

      /*
      // SingleChildScrollView : 생성자 100번 호출, 빌드 100번 호출. 0부터 시작하기 때문에 99까지 호출
      body: SingleChildScrollView(
        child: Column(
          children: children,
          //
        ),
      ),
      */
      // ListView 기본 생성자 : 생성자 100번 호출, 빌드 10번 호출. 생성자에서 빌드 메서드는 위젯을 그리는 것.
      // 연산은 cpu에서 벌어지는데 SingleChildScrollView는 100번을 연산하고, ListView는 10번을 연산함. 성능적으로 ListView가 빠르고 좋다.
      // ListView 방식은 보여지는 것만 출력을 함!
      // 스크롤을 내렸을 때 즉각적으로 바로 보일 수 있게 보이는 것 + 몇개 더 출력함! (화면애는 6개만 보이는데 10개를 그려냄)
      // 애니메이션이 있을 때 가장 차이가 큼. 싱글차일드는 버벅임
      // body: ListView(children: children),
      //
      // ListView.builder 생성자 : 생성자 10번 호출, 빌드 10번 호출
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          //
          return MyTextBox(text: "$index번째 박스");
        },
      ),
    );
  }
}
