import 'package:flutter/material.dart';
import 'package:school_app/colors/colors.dart';
import 'package:school_app/db/lesson_db_helper.dart';
import 'package:school_app/helper/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final LessonDbHelper _lessonDbHelper = LessonDbHelper();
  List _lesson = [];
  int id = 0;

  @override
  void initState() {
    super.initState();

    getLessonData();
  }

  void getLessonData() async {
    id = await SharedPreferencesHelper.getUserData("id") ?? 0;
    List lessonData = await _lessonDbHelper.getMyLessons(id);

    setState(() {
      _lesson = lessonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Your Lessons",
            textAlign: TextAlign.center,
            textScaleFactor: 5,
          ),
        ),
        Expanded(
          child: _lesson.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: whiteColor100,
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: darkColor,
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .75,
                        child: ListTile(
                          leading: const Icon(Icons.book),
                          title: Text(_lesson[index][1]),
                          subtitle: Text("Lesson Credit: ${_lesson[index][2]}"),
                        ),
                      ),
                    );
                  },
                  itemCount: _lesson.length,
                )
              : const Text("Empty Data"),
        ),
      ],
    );
  }
}
