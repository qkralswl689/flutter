import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video; // 동영상 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // 동영상이 선택됐을 때와 선택 안 됐을 때 보여줄 위젯
      body: video == null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderEmpty() {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // 너비 최대치로 늘려주기
      child:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _Logo(), //로고이미지
        SizedBox(
          height: 30.0,
        ),
        _AppName(), // 앱 이름
      ]),
    );
  }

  Widget renderVideo() {
    return Container();
  }
}

class _AppName extends StatelessWidget {
  const _AppName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w300);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'VIDEO',
          style: textStyle,
        ),
        Text(
          'PLAYER',
          style: textStyle.copyWith(fontWeight: FontWeight.w700),
          // copyWith : 현재 속성들은 그대로 유지한 채 특정 속성만 변경할 수 있는 함수 -> textStyle의 값 모두 유지한채로 글자 굵기만 700으로 변경
        )
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/logo.png',
    );
  }
}
