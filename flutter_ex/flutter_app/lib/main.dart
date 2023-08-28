import 'package:flutter/material.dart'; // material 라이브러리 import

void main() => runApp(MyApp()); //  main : pp의 시작점 , => 는 main에서 다른 함수를 호출한다는 뜻 , runApp(app) -> fluteer 의 최상의 함수이다 이합수의 ()안에는 위젯이 들어와야함 , 첫글자 소문자 : 함수 . 대문자 :  클래스

// MyApp() : 최상위 위젯 -> 최초로 앱의 레이아웃을 빌드하는 역활 (뼈대를 만드는영할 ) => 어떤 변화나 움직임이 없는 정적인 위젯 ==> stateless 위젯으로 지정
// stl 입력하면 클래스 만들수 있음
// 모든 커스텀 위젯은 또다른 위젯을 리턴하는 build 라는 함수를 가지고 있다
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp : material 라이브러리에서 제공, 실질적으로 모든 위젯을 감싸고 있따
    return  MaterialApp(
      title: "First app",
      theme: ThemeData(
        // primarySwatch :특정색의 음영들을 지정에서 사용한다 는 뜻
          primarySwatch: Colors.blue
      ),
      // home : 앱이 정상적으로 실행됐을때 가장 먼저 보여주는 경로
      home: MyHomePage() ,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold : 앱화면에 다양한 요소들을 배치하고 그릴수 있도록 도와주는 빈 도화지 같은 역할을 한다 => Scaffold 위젯이 없으면 어떠한 요소도 앱 화면에 배치할 수 없다
    return  Scaffold(
      appBar: AppBar(
        title: Text("First app"),
      ),
      //  Center 모든 요소를 가운데에 배치
      body: Center(
        // Column : 자식내의 모든 위젯을 세로로 배치
        child: Column(
          // children [] : [] 안에 세로로 정렬된 위젯을 나열하라는 의미 
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
