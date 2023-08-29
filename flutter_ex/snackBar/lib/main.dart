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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snack Bar"),
        centerTitle: true,
      ),
      body: MySnackBar() ,
    );
  }
}

class MySnackBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Show me"),
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Hello",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white
              ),
              ),
            backgroundColor: Colors.teal,
            duration: Duration(microseconds: 1000),
          ),
          );
        },
      ),
    );
  }
}
