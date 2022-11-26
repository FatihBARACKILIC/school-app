// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:school_app/colors/colors.dart';
import 'package:school_app/db/lesson_db_helper.dart';
import 'package:school_app/db/register_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';

class AddLesson extends StatefulWidget {
  const AddLesson({super.key});

  @override
  State<AddLesson> createState() => _AddLessonState();
}

class _AddLessonState extends State<AddLesson> {
  final TextEditingController _controllerLesson = TextEditingController();
  final TextEditingController _controllerLessonCredit = TextEditingController();
  final LessonDbHelper _lessonDbHelper = LessonDbHelper();
  final RegisterDbHelper _registerDbHelper = RegisterDbHelper();

  List lesson = [];
  List user = [];

  @override
  void initState() {
    super.initState();

    getLesson();
  }

  void getLesson() async {
    List lessonData = await _lessonDbHelper.getLessons();
    List userData = await _registerDbHelper.getAllUserData();
    setState(() {
      lesson = lessonData;
      user = userData;
    });
  }

  String getUserName(int id) {
    for (var element in user) {
      if (element[0] == id) {
        return element[1];
      }
    }
    return "Undefined";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                const Text(
                  "Add Lesson",
                  textScaleFactor: 5,
                ),
                Padding(
                  // padding: EdgeInsets.fromLTRB(
                  //   MediaQuery.of(context).size.width * .075,
                  //   8,
                  //   MediaQuery.of(context).size.width * .075,
                  //   0,
                  // ),

                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: _controllerLesson,
                    onSubmitted: (String text) => _clickHandler(),
                    textInputAction: TextInputAction.go,
                    decoration: const InputDecoration(
                      label: Text("Lesson Name"),
                    ),
                  ),
                ),
                Padding(
                  // padding: EdgeInsets.fromLTRB(
                  //   MediaQuery.of(context).size.width * .075,
                  //   8,
                  //   MediaQuery.of(context).size.width * .075,
                  //   0,
                  // ),
                  padding: const EdgeInsets.only(top: 8),
                  child: TextField(
                    controller: _controllerLessonCredit,
                    keyboardType: TextInputType.number,
                    onSubmitted: (String text) => _clickHandler(),
                    textInputAction: TextInputAction.go,
                    decoration: const InputDecoration(
                      label: Text("Lesson Credit"),
                    ),
                  ),
                ),
                Padding(
                  // padding: EdgeInsets.fromLTRB(
                  //   MediaQuery.of(context).size.width * .075,
                  //   8,
                  //   MediaQuery.of(context).size.width * .075,
                  //   0,
                  // ),
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _clickHandler,
                      child: const Text("Add"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: lesson.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width * .1),
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width * .1),
                      ),
                      color: whiteColor100,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Lessons",
                            textScaleFactor: 3,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: darkColor,
                                    ),
                                  ),
                                ),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .75,
                                  child: ListTile(
                                    leading: const Icon(Icons.book),
                                    title: Text(lesson[index][2]),
                                    subtitle: Text(
                                      getUserName(lesson[index][1]),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: lesson.length,
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text("Empty"),
          ),
        ],
      ),
    );
  }

  _clickHandler() async {
    int userId = await SharedPreferencesHelper.getUserData("id") ?? 0;
    String lessonName = _controllerLesson.text.trim();
    int lessonCredit = _controllerLessonCredit.text.trim().isNotEmpty
        ? int.parse(_controllerLessonCredit.text.trim())
        : 0;

    if (lessonName.isNotEmpty && lessonCredit > 0) {
      int result =
          await _lessonDbHelper.insert(userId, lessonName, lessonCredit);

      if (result == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar(content: "Not Same Lesson"),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar(content: "OK :d", color: Colors.green),
        );
        getLesson();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(content: "Fill Every area"),
      );
    }
  }

  SnackBar snackBar({required String content, Color color = Colors.red}) {
    return SnackBar(
      duration: const Duration(milliseconds: 2000),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
        textScaleFactor: 1.5,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    );
  }
}
