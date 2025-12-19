import 'package:flutter/material.dart';
import 'package:flutter_practice_1/title_row.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

/// - ListView
///     - ClipRRect : 자녀위젯 그냥 잘라줌
///         - Image
///     - Row (제목행 이라고 부르자!)(TODO 간격 구현하면서 고민!)
///         - Text
///         - Text
///     - Row
///         - Column (큰앨범 이라고 부르자!)
///             - ClipRRect
///                 - Image
///             - Text
///             - Text
///         - 큰앨범
///         - 큰앨범
///     - 제목행
///     - Row (작은앨범 이라고 부르자!)
///         - ClipRRect
///             - Image
///         - Column
///             - Text
///             - Text
///         - Icon
///     - 작은앨범
///     - 작은앨범
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // 사이즈드 박스가 더 보기 좋다 세로방향이니까
          SizedBox(height: 20),
          // 상단 이미지
          // AspectRatio 부모위젯에 넣어주면 container에 적용됨
          // ! 반응형으로 만들지 않으면 사이즈가 작아지면 위젯 안의 다른 텍스트같은게 화면이 잘려서 안 보일수도
          AspectRatio(
            // 반드시 넣어줘야 한다.
            // 가로크기 / 세로크기
            aspectRatio: 2.5 / 1,
            child: ClipRRect(
              // 셀렉트 위젯 해서 AspectRatio
              borderRadius: BorderRadius.circular(20), // 숫자는 반지름 값이다.
              child: Image.network(
                'https://picsum.photos/300/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 제목행. 여기서 작업을 하고 파일로 별도로 뺄 수 있다!
          TitleRow(title: "New Allbum"),
          // TODO 큰앨범들어가는 로우
          // 제목행
          TitleRow(title: "Song List"),
          // TODO 작은앨범들어가는 로우
        ],
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black,
            //
          ),
          child: Icon(Icons.search, color: Colors.white),
        ),
        SizedBox(width: 16),
      ],
      // title 속성은 안드로이드에서는 왼쪽 기본
      // 아이폰에서는 가운데 기본
      // centerTitle false 주게되면은 왼쪽으로 가지만
      // title에 Column 을 배치하면 Column 크기가 앱바 영역전체를
      // 차지하기 때문에 무용지물
      // 이럴땐 Column의 crossAxisAlignment 속성으로 조정
      // Column과 Row의 crossAxisAlignment 기본값은 가운데!
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Music",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              //
            ),
          ),
          Row(
            children: [
              Container(
                width: 16,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  //
                ),
              ),
              SizedBox(width: 3),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                  //
                ),
              ),
              //
            ],
          ),
        ],
      ),
    );
  }
}
