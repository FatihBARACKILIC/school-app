class Person {
  int? id;
  String? userName;
  String? eMail;
  String? password;

  Person(this.userName, this.eMail, this.password);
  Person.withId(this.id, this.userName, this.eMail, this.password);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["id"] = id;
    map["userName"] = userName;
    map["eMail"] = eMail;
    map["password"] = password;

    return map;
  }

  Person.getMap(Map<String, dynamic> map) {
    id = map["id"];
    userName = map["userName"];
    eMail = map["eMail"];
    password = map["password"];
  }
}
