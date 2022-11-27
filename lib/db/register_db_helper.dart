import 'package:path/path.dart';
import 'package:school_app/model/person.dart';
import 'package:sqflite/sqflite.dart';

class RegisterDbHelper {
  static Database? _database;

  String personTable = "person";
  String columnId = "id";
  String columnUserName = "userName";
  String columnEMail = "email";
  String columnPassword = "password";

  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database?> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "person.db");

    Database personDb = await openDatabase(
      dbPath,
      version: 1,
      onCreate: createDb,
    );
    return personDb;
  }

  void createDb(Database db, int version) async {
    await db.execute("""
      Create Table $personTable (
        $columnId integer primary key,
        $columnUserName text,
        $columnEMail text,
        $columnPassword text
      )
      """);
  }

  Future<int> getUserId(String email, String password) async {
    Database? db = await database;

    List userData = await db!.query(
      personTable,
      columns: [
        columnId,
      ],
      where: "$columnEMail=? and $columnPassword=?",
      whereArgs: [email, password],
    );

    if (userData.isNotEmpty) {
      return userData[0]["id"];
    } else {
      return 0;
    }
  }

  Future getUserData(int id) async {
    Database? db = await database;
    List userData = await db!.query(
      personTable,
      columns: [
        columnId,
        columnUserName,
        columnEMail,
        columnPassword,
      ],
      where: "$columnId=?",
      whereArgs: [id],
    );
    List user = [
      userData[0]["id"]!,
      userData[0]["userName"]!,
      userData[0]["email"]!,
      userData[0]["password"]!,
    ];

    return user;
  }

  Future getAllUserData() async {
    Database? db = await database;

    List userData = await db!.query(
      personTable,
      columns: [
        columnId,
        columnUserName,
        columnEMail,
        columnPassword,
      ],
    );
    List user = [];

    if (userData.isNotEmpty) {
      for (var element in userData) {
        user.add([
          element["id"]!,
          element["userName"]!,
          element["email"]!,
          element["password"]!,
        ]);
      }
    }

    return user;
  }

  Future<int> insert(Person person) async {
    Database? db = await database;

    if (await mailCheck(person.eMail.toString())) return 0;

    int result = await db!.insert(personTable, person.toMap());

    return result;
  }

  Future<bool> mailCheck(String email) async {
    Database? db = await database;

    List user = await db!.query(
      personTable,
      columns: [columnEMail],
      where: "$columnEMail=?",
      whereArgs: [email],
    );

    return user.isEmpty ? false : true;
  }

  Future<int> update(
    int id,
    String uName,
    String uMail,
    String password,
  ) async {
    Database? db = await database;

    int result = await db!.rawUpdate("""
      UPDATE $personTable SET
      $columnUserName=?,
      $columnEMail=?,
      $columnPassword=?
      WHERE $columnId=?
    """, [uName, uMail, password, id]);

    return result;
  }

  Future<int> deletePerson(int id) async {
    Database? db = await database;

    int result = await db!.delete(
      personTable,
      where: columnId,
      whereArgs: [id],
    );

    return result;
  }

  Future<int> deleteAllDB() async {
    Database? db = await database;

    int result = await db!.delete(personTable);

    return result;
  }
}
