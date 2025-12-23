
// 사이즈드 박스보다 쓰기 좋은 것 익스탠션
// 익스텐션 문법

void
// 기존 클래스에 메서드 추가할 때!



extension doubleExt on double {
  // 3.0.w() 이렇게 씀!
  Widget w() {
    return SizedBox(width: this);
  }

  // dart파일 만들어서 쓰면 됨
  Widget get h {
    return SizedBox(height: this);
  }
}

extension IntExt on int {
  // 3.0.w() 이렇게 씀!
  Widget w() {
    return SizedBox(width: toDouble());
  }
}

extension doubleExt on double {
  // getter => 파라미터 없는 함수에서 괄호 생략!!
  // 속성을 가지고 있는 것 처럼 3.w 이렇개 씀
  Widget get w {
    return SizedBox(width: this);
  }
}
