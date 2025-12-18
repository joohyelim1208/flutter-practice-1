import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    return MaterialApp(home: HomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _HomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  ///### body
///- SingleChildScrollView => 자녀 위젯이 많으면 사용 안한다!!
///- ListView
///   - ClipRRext : 자녀위젯을 그냥 잘라준다. borderRadius속성이 있음 (많이씀! Container는 안됨)
///      - Image
///   - Row (제목행 이라고 부르자)(TODO로 간격 구현하면서 고민!)
///      - Text
///      - Text(>도 아이콘이 아니라 그냥 글자로 쳐줬다)
///     (글자 사이를 띄워주는 방법은 3가지가 있다.)
///   - Row
///     - Column (큰앨범 이라고 부르자. 같은 구조 3개)
///       - ClipRRect
///          - Image
///       - Text
///       - Text
///    - 큰앨범
///    - 큰앨범
///  - 제목행
///  - Row (작은앨범 이라고 부르자.)
///     - ClipRRect
///        - Image
///     - Column
///        - Text
///        - Text
///     - Icon 
///  - 작은앨범
///  - 작은앨범
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Column(
        // 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Music",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  ),
              ),
              SizedBox(width: 16),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100)
                  ),
              ),
          )
        ],
      ),
      ),
      //
    );
  }

}
}

// 코드를 짜다가 중간에 많이 꼬여버렸다..
// 구조를 잡는 개념만 이해하고 개인과제로 넘어가기로 했다.
