import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Charactor card",
      home: MyCard(),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBANTO"),
        // 타이틀 가운데 정렬
        centerTitle: true,
        // appBar 배경색 지정
        backgroundColor: Colors.redAccent,
        // elevation : appBar가 떠있는 상태 없애기 -> 아래 쉐도우 없애기
        elevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
          child: Column(
            // 세로에서 위치 지정
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello"),
            Text("Hello"),
            Text("Hello")
        ],
      ),
      ),
    );
  }
}
