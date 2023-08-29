import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Appbar",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar icon nemu"),
        centerTitle: true,
        elevation: 0.0,
        // leading : 아이콘,위젯을 앱바 타이틀 왼쪽에 위치시키는것
        // leading:
        // IconButton(
        //   // Icons.menu : 햄버거 버튼
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     print("click");
        //   },
        // ),
        //actions : 오른쪽 정렬
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print("shopping_cart_click");
          },
        ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("search_click");
            },
          ),
        ],
      ),
      // Drawer : 메뉴
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //UserAccountsDrawerHeader() : 이미지
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("이미지 경로"),
                backgroundColor: Colors.white,
              ),
              // 헤더 오른쪽에 이미지 넣기
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("이미지 경로"),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("이미지 경로"),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text("dd"),
              accountEmail: Text("ff"),
              // onDetailsPressed : 기능
              onDetailsPressed: (){
                print("ffffffff");
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
              ),
            ),
           // 메뉴
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOme"),
              onTap: (){
                print("Home click");
              },
              // + 버튼 추가
              trailing: Icon(Icons.add),
            ), ListTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
              onTap: (){
                print("settings click");
              },
              // + 버튼 추가
              trailing: Icon(Icons.add),
            ), ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("question_answer"),
              onTap: (){
                print("question_answer click");
              },
              // + 버튼 추가
              trailing: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
