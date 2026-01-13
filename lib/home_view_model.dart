import 'package:flutter_practice_1/matzip.dart';
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
    return HomeState(matzipList: []);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
