class Lesson {
  int? id;
  int? userId;
  String? lessonName;
  int? lessonCredit;

  Lesson(this.userId, this.lessonName, this.lessonCredit);
  Lesson.withId(this.id, this.userId, this.lessonName, this.lessonCredit);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["userId"] = userId;
    map["lessonName"] = lessonName;
    map["lessonCredit"] = lessonCredit;

    return map;
  }

  Lesson.getMap(Map<String, dynamic> map) {
    id = map["id"];
    userId = map["userId"];
    lessonName = map["lessonName"];
    lessonCredit = map["lessonCredit"];
  }
}
