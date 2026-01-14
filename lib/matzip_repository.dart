import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/ffi_dynamic_library_patch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice_1/matzip.dart';

class MatzipRepository {
  // 파이어스토어에서 맛집 가져와서 맛집 리스트로 변환해서 뷰모델에 전달해줘야 함
  // 비동기로 가지고 와야 함
  Future<List<Matzip>> getAllMatzip() async {
    print('getAllMatzip 호출됨');
    // 컬렉션 모든 문서들 가지고 오기. 참조를 먼저 해줘야 됨 첫번째!!
    final colRef = FirebaseFirestore.instance.collection('matzip');
    final result1 = await colRef.get();
    final docs = result1.docs;

    // 리스트를 맵으로 변환해보기
    List<Matzip> matzipList = docs.map((e) {
      // 이 안에서 어떤 로직을 추가해도 상관없다!
      return Matzip.fromJson(e.data());
    }).toList();
    // 파이어스토어에서 데이터를 가지고 오면 타입은
    // (문서들)List -> 안에 Map. Json형태 변경

    // 맛집리스트로 변환 무엇을?

    // 맛집리스트 반환해주기
    return matzipList;
  }
}
