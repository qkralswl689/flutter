import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 오른쪽 상단 디버그 글씨 없애기
      debugShowCheckedModeBanner: false,
      title: "BBANTO",
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body 백 컬러 
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text("BBANTO"),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          // 컬럼 내의 모든 요소들 가로 정렬 , start : 왼쪽 정렬
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 이미지
            Center(
              child: CircleAvatar(
                backgroundImage:  AssetImage("assets/module-free.gif"),
                // 이미지 크기
                radius: 60.0,
              ),
            ),
            // 구분선 입력
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              // 선 두꼐
              thickness: 0.5,
              // 구분선의 끝(오른쪽) 패딩값 설정
              endIndent: 30.0,
            ),

            Text("Name",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
           ),
          // 텍스트 들 사이 공간 지정
          SizedBox(
            height: 10.0,
          ),
          Text("BBANTO",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 28.0,
            fontWeight: FontWeight.bold
           ),
          ),
            SizedBox(
              height: 30.0,
            ),
            Text("BBANTO POWER LEVEL",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            // 텍스트 들 사이 공간 지정
            SizedBox(
              height: 10.0,
            ),
            Text("14",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),SizedBox(
              height: 30.0,
            ),
            //Row : 아이콘과 텍스트를 가로로 나열
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  // 가로 간격
                  width: 10.0,
                ),
                Text("using lightsaber" ,
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  // 가로 간격
                  width: 10.0,
                ),
                Text("face hero tattoo" ,
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  // 가로 간격
                  width: 10.0,
                ),
                Text("fire flamesr" ,
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                )
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage:  AssetImage("assets/poggch-pogg.gif"),
                // 이미지 크기
                radius: 40.0,
                backgroundColor: Colors.amber[800],

              ),
            ),
          ],
        ),
      ),
    );
  }
}
