import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:my_achive_idea/data/idea_info.dart';
import 'package:my_achive_idea/database/database_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // db 접근을 용이하게 해주는 유틸 객체
  var dbHelper = DatabaseHelper();

  // 아이디어 목록 데이터들이 담길 공간
  List<IdeaInfo> listIdeaInfo = [];

  @override
  void initState() {
    super.initState();

    // 아이디어 목록들 가져오기
    getIdeaInfo();

    //임시용 insert data
    //setInsertIdeaInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Archive Idea',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: listIdeaInfo.length,
          itemBuilder: (context, index) {
            return listItem(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 새 아이디어 작성 화면으로 이동
          Navigator.pushNamed(context, '/edit');
        },
        backgroundColor: const Color(0xff7f52fd).withOpacity(0.7),
        child: Image.asset(
          'assets/idea.png',
          width: 48,
          height: 48,
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      height: 82,
      margin: const EdgeInsets.only(top: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xffd9d9d9),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // 아이디어 제목
          Container(
            margin: const EdgeInsets.only(
              left: 16,
              bottom: 16,
            ),
            child: Text(
              listIdeaInfo[index].title,
              // 'ddddd',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          // 일시
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 16, bottom: 8),
              child: Text(
                DateFormat('yyyy.MM.dd HH:mm').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        listIdeaInfo[index].createAt)),
                // '1234',
                style: const TextStyle(
                  color: Color(0xffaeaeae),
                  fontSize: 10,
                ),
              ),
            ),
          ),
          // 아이디어 중요도 점수 (별 형태)
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 16, bottom: 8),
              child: RatingBar.builder(
                initialRating: listIdeaInfo[index].priority.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 16,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                ignoreGestures: true,
                updateOnDrag: false,
                onRatingUpdate: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getIdeaInfo() async {
    // 아이디어 목록 조회
    await dbHelper.initDatabase();
    listIdeaInfo = await dbHelper.getAllIdeaInfo();

    // 리스트 객체 역순으로 정렬
    listIdeaInfo.sort((a, b) => b.createAt.compareTo(a.createAt));
    setState(() {});
  }

  Future setInsertIdeaInfo() async {
    await dbHelper.initDatabase();

    await dbHelper.insertIdeaInfo(
      IdeaInfo(
          title: '# 환경 보존 문제해결 앱 아이디어',
          motive: '길가다가 쓰레기 주우면서 생각',
          content: '자세한 내용 입니다..',
          priority: 5,
          feedback: '피드백 사항',
          createAt: DateTime.now().millisecondsSinceEpoch),
    );
  }
}
