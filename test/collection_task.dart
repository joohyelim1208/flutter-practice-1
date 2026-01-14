import 'dart:convert';

import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_test/flutter_test.dart';

final jsonData = """
[
  {
    "상호명": "진미평양냉면",
    "주소": "서울특별시 강남구 학동로 305-3",
    "평점": "4.5"
  },
  {
    "상호명": "우래옥",
    "주소": "서울특별시 중구 창경궁로 62-29",
    "평점": "4.8"
  },
  {
    "상호명": "연남족발 1987",
    "주소": "서울특별시 마포구 동교로 222",
    "평점": "4.2"
  }
]
""";
// [] 대괄호 -> 리스트라는 뜻 타입이 list로 와야함

void main() {
  test('컬렉션 메서드 테스트', () {
    // 1. Map으로 바꿔주기 역직렬화 List<Map<String, dynamic>>
    List<dynamic> box = jsonDecode(jsonData);
    // 2. 객체로 바꿔주기
    List<Matzip> matzipList = [];
    for (var i = 0; i < box.length; i++) {
      Map<String, dynamic> e = box[i];
      Matzip m = convertMatzip(e);
      matzipList.add(m);
    }
    print(matzipList.length);
    // Collection 메서드
    List<Matzip> matzipList2 = box.map((e) {
      return Matzip.fromJson(e);
    }).toList();
  });
}

Matzip convertMatzip(dynamic e) {
  Matzip m = Matzip.fromJson(e);
  return m;
}
