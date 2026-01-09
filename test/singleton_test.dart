import 'package:flutter/material.dart';

// //}

// 클래스 구성요소
// 속성, 메서드, 생성자
class MyClass {
  // 생성자를 지정하지 않으면 기본 생성자를 만들어줌. MyClass();
  //
  int count = 1;
  ThemeMode themeMode = ThemeMode.light;
}

void main() {
  // 처음 인스턴스 null이 들어가 있고, 메모리에 객체가 생성이 되서 기록이 됨.
  // 아무리 많은 객체를 생성해도 메모리에는 1개만 들어감
  final m1 = MySingletonClass();
  final m2 = MySingletonClass();
  // 만약 생성자를 직접 호출하면? 네임드생성자를 _ 프라이빗으로 바꿔줘야 함. 생성자 밖에서 사용할 수 없게
  final m2 = MySingletonClass.make();
}

// 싱글톤 패턴
// 객체를 하나만 생성해서 앱 전체에서 공유해서 사용할 수 있도록 클래스를 만드는 방법!
// 객체 생성자를 여러번 호출해도 메모리에는 최초 하나만 생성이 되게 클래스를 설계하는 방법!
class MySingletonClass {
  // 1. 객체를 담아놓을 변수가 필요!
  // static 변수가 스테틱이냐 아니냐의 차이는?? 클래스에 귀속이 되서 변수명.은 못 씀. 일반 변수는 각 개체 별 정보가 들어가지만 스테틱은 전체가 동일한 정보가 들어감
  static MySingletonClass? instance;
  // 2. 생성자 즉 함수를 조금 변형시킨다 -> 생성자에서 1번 변수에 객체가 담겨있으면 기존객체, 아니라면 새로운 객체 생성
  // 생성자 {} 중괄호 사용하면 이 안에서 로직 실행 가능!
  // MySingletonClass() {
  // 객체를 생성하면서 로직 실행 가능!
  // 이미 객체를 생성하고 로직 실행! (객체가 하나만 생성해야 되는데??)

  // }
  // 같은 파일 이외에 사용불가! _ 언더바 붙이면 프라이빗 생성자!!!
  // 이렇게 하나의 패턴으로 공유하기 위해 사용하는 것이 싱글톤 패턴
  MySingletonClass._make();

  factory MySingletonClass() {
    // factory생성자
    // 객체를 생성하기 전 로직을 실행할 수 있음!
    if (instance == null) {
      // 팩토리의 생성자가 실행이 됨. 무한 반복으로 돌아가게 됨. 또 다른 생성자를 만들어줘야함 네임드 생성자. 를 이용해서 객체를 생성
      instance = MySingletonClass.make();
    }
    return instance;
  }
}
