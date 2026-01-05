import 'package:flutter/material.dart';
import 'package:flutter_practice_1/speed.dart';
import 'package:flutter_practice_1/temp.dart';
import 'package:flutter_practice_1/weather.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("오늘의 날씨"),
        //
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (weather != null) Temp(weather: weather!),
            if (weather != null) Speed(weather: weather!),
            IconButton(icon: Icon(Icons.refresh)),
          ],
        ),
      ),
    );
  }
}
