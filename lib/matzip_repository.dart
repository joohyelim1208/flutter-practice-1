import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice_1/matzip.dart';

class MatzipRepository {
  // 파이어스토어에서 맛집 가져와서 맛집 리스트로 변환해서 뷰모델에 전달해줘야 함
  // 비동기로 가지고 와야 함
  Future<List<Matzip>> getAllMatzip() async {
    print('getAllMatzip 호출됨');
    // 컬렉션 모든 문서들 가지고 오기. 참조를 먼저 해줘야 됨 첫번째!!
    final colRef = FirebaseFirestore.instance.collection('matzip');

    // 파이어스토어에서 데이터를 가지고 오면 타입은 (문서들)List -> 안에 Map. Json형태 변경
    // 맛집리스트로 변환 무엇을?

    // 맛집리스트 반환해주기
    return [];
  }
}
