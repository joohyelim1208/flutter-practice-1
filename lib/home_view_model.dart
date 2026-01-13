import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_practice_1/matzip_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  // 여기에 맛집 리스트
  final List<Matzip> matzipList;
  HomeState({required this.matzipList});
}

// 뷰모델 리버팟 패키지 설치해주고, 관리하는 상태<>
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    print('뷰모델 build 호출됨');
    getData();
    return HomeState(matzipList: []);
  }

  Future<void> getData() async {
    // 프린트함수로 먼저 정상작동 되는지 확인
    print('getData 호출됨');
    // 여기서 파이어스토어 데이터를 가져오는 것. 가져와서 맛집 리스트로 변환
    final repo = MatzipRepository();
    final matzipList = await repo.getAllMatzip();
    // 상태 업데이트
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
