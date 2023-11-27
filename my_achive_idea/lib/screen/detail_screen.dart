import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_achive_idea/data/idea_info.dart';
import 'package:my_achive_idea/database/database_helper.dart';

class DetailScreen extends StatelessWidget {
  IdeaInfo? ideaInfo;
  DetailScreen({super.key, this.ideaInfo});
  final dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          ideaInfo!.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              //팝업
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('주의'),
                      content: const Text('아이디어를 삭제하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            '취소',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            // 아이디어 삭제처리
                            await setDeleteIdeaInfo(ideaInfo!.id!);

                            // 이전화면으로 복귀 1.팝업 종료, 2.화면 종료
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              Navigator.of(context);
                            }
                          },
                          child: const Text(
                            '삭제',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: const Text(
              '삭제',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '아이디어를 떠올린 계기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ideaInfo!.motive,
                      style: const TextStyle(
                        color: Color(
                          0xffa5a5a5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      '아이디어 내용',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ideaInfo!.content,
                      style: const TextStyle(
                        color: Color(
                          0xffa5a5a5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      '아이디어 중요도 점수',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: ideaInfo!.priority.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 35,
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
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      '유저 피드백 사항',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ideaInfo!.feedback,
                      style: const TextStyle(
                        color: Color(
                          0xffa5a5a5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              height: 65,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('내용 편집하기'),
            ),
            onTap: () async {
              Navigator.pushNamed(
                context,
                '/edit',
                arguments: ideaInfo,
              );
            },
          )
        ],
      ),
    );
  }

  Future setDeleteIdeaInfo(int id) async {
    await dbHelper.initDatabase();

    await dbHelper.deleteIdeaInfo(id);
  }
}
