import 'package:flutter/material.dart';
// 변수는 홈페이지에서
// 함수는 여기에서! 관리

class PlusOne extends StatelessWidget {
  // 앞에 const를 꼭 지워줘야!!!! 실행이 됨
  PlusOne({super.key, required this.plusClick});

  // 9) 셋스테이트 위젯에 있는걸 가져와도 아무런 변화가 없음!
  // GestureDetector 마우스 올려보면 어떤 함수를 쓸 수 있는지 확인
  // 함수도 변수처럼 사용이 가능하다. void Function()타입 을 써서 위에 생성자 쓰기
  void Function() plusClick;

  @override
  Widget build(BuildContext context) {
    // 1-1)컨테이너를 위젯으로 감싸줌 버튼만들기
    // 8-1) GestureDetector 위젯으로 만들고 파일로 빼줌!
    return GestureDetector(
      onTap: () {
        // 11) 함수타입을 실행하려면 ()붙여줌. 함수를 전달해서 실행한 것.
        plusClick();
        /*
        print("플러스1");
        // 3)넘버가 1씩 증가했으면 할 때
                
        number = number + 1;
        print(number);
        // 5) 이걸 써줘야 숫자가 올라가는게 보여서작동된다!!!!
        // 7) 상태값이 바꼈으니 다시 그려달라고 하는것 build메서드에 있는걸 전부 위에서부터 다시 그림
        //    플러터 프레임워크에 build메서드 다시 호출해서 그림을 다시 그리라고 명령하는 함수!
        setState(() {});
        */
      },

      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        child: Icon(Icons.plus_one, size: 48),
      ),
    );
  }
}
