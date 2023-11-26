class IdeaInfo {
  // 데이터 컬럼 id
  int? id;
  String title;
  String motive;
  String content;
  int priority;
  String feedback;
  int createAt;

  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.priority,
    required this.feedback,
    required this.createAt,
  });

// IdeaInfo 객체를 map 객체로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'motive': motive,
      'content': content,
      'priority': priority,
      'feedback': feedback,
      'createAt': createAt,
    };
  }

// Map 객체를 IdeaInfo 데이터 클래스로 변환
  factory IdeaInfo.fromMap(Map<String, dynamic> map) {
    return IdeaInfo(
        id: map['id'],
        title: map['title'],
        motive: map['motive'],
        content: map['content'],
        priority: map['priority'],
        feedback: map['feedback'],
        createAt: map['createAt']);
  }
}
