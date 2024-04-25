import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player_app/component/custom_video_player.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width, // 너비 최대치로 늘려주기
      decoration: getBoxDecoration(),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _Logo(
          onTap: onNewVideoPressed,
        ), //로고이미지
        const SizedBox(
          height: 30.0,
        ),
        const _AppName(), // 앱 이름
      ]),
    );
  }

  Widget renderVideo() {
    return Center(
      child: CustomVideoPlayer(
        video: video!, //선택된 동영상 입력해주기
      ), // 동영상 재생기 위젯
    );
  }

  BoxDecoration getBoxDecoration() {
    return const BoxDecoration(
      // 그라데이션으로 색상적용하기
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2A3A7C), Color(0xFF000118)],
      ),
    );
  }

// 이미지 선택하는 기능을 구현한 함수
  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      // magePicker().pickVideo() : 동영상을 선택하는 화면을 실행할 수 있다
      source: ImageSource.gallery, // 이미 저장되어 있는 동양상을 갤러리로부터 선택하는 화면 실행
      // ImageSource.camera : 카메라를 실행한 후 동영상 촬영을 마치면 해당 영상이 선택된다
      // => 선택된 동영상을 XFile 형태로 비동기로 반환받을 수 있으며 사용자가 선택한 값이 존재하면 video 변수에 저장한다
    );

    if (video != null) {
      setState(() {
        this.video = video;
      });
    }
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
  final GestureTapCallback onTap; // 탭 했을때 실행함수
  const _Logo({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'asset/img/logo.png',
      ),
    );
  }
}
