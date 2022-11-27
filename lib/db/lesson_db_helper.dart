import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LessonDbHelper {
  static Database? _database;

  String lessonTable = "lesson";
  String columnId = "id";
  String columnUserId = "userId";
  String columnLessonName = "lessonName";
  String columnLessonCredit = "lessonCredit";

  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database?> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "lesson.db");

    Database lessonDb = await openDatabase(
      dbPath,
      version: 1,
      onCreate: createDb,
    );
    return lessonDb;
  }

  //! Remove
  // void printRed(var data) {
  //   print("\x1B[31m$data\x1B[0m");
  // }

  void createDb(Database db, int version) async {
    await db.execute("""
      Create Table $lessonTable (
        $columnId integer primary key,
        $columnUserId integer,
        $columnLessonName text,
        $columnLessonCredit integer
      )
      """);
  }

  Future<int> insert(int userID, String lName, int lCredit) async {
    Database? db = await database;

    if (await lessonCheck(lName)) return 0;

    int result = await db!.rawInsert("""
      INSERT INTO $lessonTable(
        $columnUserId,
        $columnLessonName,
        $columnLessonCredit
        )
        VALUES(?, ?, ?)
    """, [userID, lName, lCredit]);

    return result;
  }

  Future<bool> lessonCheck(String name) async {
    Database? db = await database;

    List lesson = await db!.query(
      lessonTable,
      columns: [columnLessonName],
      where: "$columnLessonName=?",
      whereArgs: [name],
    );

    return lesson.isEmpty ? false : true;
  }

  Future getLessons() async {
    Database? db = await database;

    List lessonData = await db!.query(
      lessonTable,
      columns: [
        columnId,
        columnUserId,
        columnLessonName,
        columnLessonCredit,
      ],
    );

    List lesson = [];

    if (lessonData.isNotEmpty) {
      for (var e in lessonData) {
        lesson.add([
          e[columnId],
          e[columnUserId],
          e[columnLessonName],
          e[columnLessonCredit],
        ]);
      }
    }

    return lesson;
  }

  Future getMyLessons(int id) async {
    Database? db = await database;

    List lessonData = await db!.query(
      lessonTable,
      columns: [
        columnId,
        columnLessonName,
        columnLessonCredit,
      ],
      where: "$columnUserId=?",
      whereArgs: [id],
    );

    List lesson = [];

    if (lessonData.isNotEmpty) {
      for (var e in lessonData) {
        lesson.add([
          e[columnId],
          e[columnLessonName],
          e[columnLessonCredit],
        ]);
      }
    }

    return lesson;
  }
}
