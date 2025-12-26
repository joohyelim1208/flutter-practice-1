import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practice_1/post.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 251226 역직렬화
  List<Post> postList = [];
  // i 누르고 오버라이드
  @override
  void initState() {
    super.initState();
    // HomePage 위젯이 화면에 보이고 난 후 단 한번만 실행되는 함수 initState
    // 여기서 await 쓰려면 위에 async 붙여줘야 됨. 하지만 오류가 남!
    loadData();
  }

  void loadData() async {
    print("데이터 가져오기 시작");
    // 1. JSON 데이터를 불러오기
    //    터미널에서 입력 flutter pub add http
    //    HTTP 통신 하기 위해서 http 패키지 추가
    //    http 패키지의 Client라는 객체를 이용해서 편지를 쓸 수 있음
    Client c = Client();
    Response result = await c.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    ); // 브라우저에서 주소 입력하고 엔터 치는거랑 똑같은 행동
    print(result.statusCode); // 답장의 상태. 200 -> 성공, 404 -> 답장을 쓸 수 없음
    // result.body에 답장의 내용이 문자열 형태로 담겨있음
    String data = result.body;

    // 2. 문자열을 객체로 변환(역직렬화)
    // JSON의 최상위는 리스트가 될 수 있음!
    final List<dynamic> decodedeData = jsonDecode(data);
    print(decodedeData.runtimeType);

    for (Map<String, dynamic> d in decodedeData) {
      print(d.runtimeType);
      Post newPost = Post(
        userId: d["userId"],
        id: d["id"],
        title: d["title"],
        body: d["body"],
      );
      postList.add(newPost);
    }
    print("데이터 가져오기 끝");

    // 3. 화면에 그려주는 것
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("위젯 그리기 시작");

    List<Widget> listViewChildren = [];
    // Listview의 children속성에 들어갈 리스트 만들기
    // 반복문 이용해서 postList내에 있는 모든 요소 위젯으로 만들기

    for (var index = 0; index < postList.length; index++) {
      // children속성에 들어갈 리스트에 추가해주기
      Post p = postList[index];
      Widget item = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
        ),
        //간격 띄워주기
        padding: EdgeInsets.all(20),
        child: Column(
          // 내용 좌측정렬
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("포스트 아이디 : ${p.id}"),
            Text("사용자 아이디 : ${p.userId}"),
            Text("제목 : ${p.title}"),
            Text("내용 : ${p.body}"),
          ],
        ),
      );
      listViewChildren.add(item);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('블로그 샘플'),
        //
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        // 안에 칠드런 속성들 다 지워주고
        // 100개가 출력된다!
        children: listViewChildren,
      ),
    );
  }
}
