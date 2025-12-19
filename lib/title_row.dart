import 'package:flutter/material.dart';

// Row에서 익스트랙 위젯 - 타이틀 투 파일 하면 이렇게 별도 폴더가 쉽게 생긴다!!
//
class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.title});

  // 별도로 하나 빼준 것. 아니면 메인에 타이틀 2개가 같은걸로 적용이 되서
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text 위젯의 크기가 없을 경우
        // 글자 길이만큼 크기를 차지!
        // 글자가 길어져서 화면크기 이상으로 길어진다면
        // overflow 속성을 활용할 수 없음!
        Expanded(
          child: Text(
            title, // 앨범이름을 타이틀로 변경해줌 따로 메인에서 다시 써줌
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // wordSpacing: -1,
              // 글자간 가로 간격
              letterSpacing: -1.5,
              // 간격이 조금 다르게 보여질 때 꼭 설정
              // fontSize* height 한 값이 Text 위젯의 높이가 됨!
              height: 1,
            ),
          ),
        ),
        Text(
          "See all >",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        // Spacer로 간격을 띄워주면 직관적이고 좋다. 다른 방법으로 Expanded로 하면 줄바꿈이 됨. overflow로 하면 글자가 길어도 화면 밖으로 그냥 옆에 이어짐
        // Spacer(),

        //
      ],
    );
  }
}
