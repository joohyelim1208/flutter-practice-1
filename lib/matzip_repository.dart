import 'package:flutter_practice_1/matzip.dart';

class MatzipRepository {
  // 파이어스토어에서 맛집 가져와서 맛집 리스트로 변환해서 뷰모델에 전달해줘야 함
  // 비동기로 가지고 와야 함
  Future<List<Matzip>> getAllMatzip() async {
    print('getAllMatzip 호출됨');
    return [];
  }
}
