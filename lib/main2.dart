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
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: .center,
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
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      //
    );
  }
}







