import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController introduceController = TextEditingController();

  // 자기소개 수정 모드
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    // 위젯 처음 실행시 호출
    getIntroductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.accessibility_new,
          color: Colors.black,
          size: 32,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '발전하는 개발자 박민지를 소개 합니다',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/dog.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //이름
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'MingKi',
                  ),
                ],
              ),
            ),
            //나이
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      '나이',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '33',
                  ),
                ],
              ),
            ),
            // 취미
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      '취미',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '주짓수',
                  ),
                ],
              ),
            ),
            // 직업
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      '직업',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '개발자',
                  ),
                ],
              ),
            ),
            // 학력
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      '학력',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '명지대학교',
                  ),
                ],
              ),
            ),
            // MBTI
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'MBTI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'ESFJ',
                  ),
                ],
              ),
            ),
            // 자기소개
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, top: 16),
                  child: const Text(
                    '자기소개',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16, top: 16),
                    child: Icon(
                      Icons.mode_edit,
                      color: isEditMode ? Colors.blueAccent : Colors.black,
                      size: 24,
                    ),
                  ),
                  onTap: () async {
                    if (isEditMode == false) {
                      setState(() {
                        isEditMode = true;
                      });
                    } else {
                      // 저장 로직
                      if (introduceController.text.isEmpty) {
                        var snackBar = const SnackBar(
                          content: Text('자기소개 입력 값이 비어있습니다.'),
                          duration: Duration(seconds: 2),
                        );
                        // 스낵바 사용 하기위해 사용 : ScaffoldMessenger
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      } else {
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setString(
                            'introduce', introduceController.text);
                      }

                      setState(() {
                        isEditMode = false;
                      });
                    }
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: TextField(
                maxLines: 5,
                controller: introduceController,
                enabled: isEditMode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getIntroductData() async {
// 기존에 저장된 자기소개 데이터 불러오기
    var sharedPref = await SharedPreferences.getInstance();
    String introductMsg = sharedPref.getString('introduce').toString();

    introduceController.text = introductMsg;
  }
}
