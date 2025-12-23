import 'package:flutter/material.dart';
import 'package:flutter_practice_1/big_album.dart';
import 'package:flutter_practice_1/mini_album.dart';
import 'package:flutter_practice_1/rounded_image.dart';
import 'package:flutter_practice_1/title_row.dart';

// 1. 일단 Scaffold 안에서 작업
// 2. 완성되면 위젯클래스로 분리
// 3. 위젯클래스를 별도의 파일로 분리
// 4. Scaffold에 위젯 배치
// 5. 변경되어야 하는 부분들 속성으로 정의해서 수정!

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

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
            // clipRract가 너무 길어져서 위젯으로 만들어줌!RoundedImage(),
            // 새로운 클래스가 만들어짐
            child: RoundedImage(imageUrl: 'https://picsum.photos/300/200'),
          ),
          // 제목행. 여기서 작업을 하고 파일로 별도로 뺄 수 있다!
          TitleRow(title: "New Allbum"),
          // 큰앨범들어가는 로우
          // 제목행
          Row(
            children: [
              //Column을 crossAxisAlignment 왼쪽으로 시작시킬 때
              // Column을 BigAlbum(),으로 위젯을 만들어줌.
              // id/1 각 다른 이미지 출력. 뒤에 숫자만 맘에든 이미지로 써주면 됨.
              BigAlbum(
                imageUrl: 'https://picsum.photos/id/1/200/200',
                title: 'aaa',
                artist: 'sss',
              ),
              SizedBox(width: 10),
              BigAlbum(
                imageUrl: 'https://picsum.photos/id/2/200/200',
                title: 'bbb',
                artist: 'hhh',
              ),
              SizedBox(width: 10),
              BigAlbum(
                imageUrl: 'https://picsum.photos/id/1000/200/200',
                title: 'ccc',
                artist: 'lll',
              ),
            ],
          ),
          TitleRow(title: "Song List"),

          // 작은앨범들어가는 로우
          // row위젯으로 만들어줘야 함 MiniAlbum
          // 미니앨범도 완료됐으면 파일로 빼주기!
          MiniAlbum(
            imageUrl: 'https://picsum.photos/id/777/200/200',
            title: 'www',
            artist: 'ooo',
          ),
          SizedBox(height: 10),
          MiniAlbum(
            imageUrl: 'https://picsum.photos/id/999/200/200',
            title: 'yyy',
            artist: 'rrr',
          ),
          SizedBox(height: 10),
          MiniAlbum(
            imageUrl: 'https://picsum.photos/id/456/200/200',
            title: 'ppp',
            artist: 'qqq',
          ),

          Icon(Icons.more_horiz),
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
