class IdeaInfo {
  // 데이터 컬럼 id
  int? id;
  String title;
  String motive;
  String content;
  int priority;
  String feedback;
  int createdAt;

  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.priority,
    required this.feedback,
    required this.createdAt,
  });

// IdeaInfo 객체를 map 객체로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'motive': motive,
      'priority': priority,
      'feedback': feedback,
      'createdAt': createdAt,
    };
  }

// Map 객체를 IdeaInfo 데이터 클래스로 변환
  factory IdeaInfo.fromMap(Map<String, dynamic> map) {
    return IdeaInfo(
        id: map['id'],
        title: map['map'],
        motive: map['motive'],
        content: map['content'],
        priority: map['priority'],
        feedback: map['feedback'],
        createdAt: map['createdAt']);
  }
}
