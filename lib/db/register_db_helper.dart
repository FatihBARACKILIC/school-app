import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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

  Future<int> insert(Person person) async {
    Database? db = await database;

    int result = await db!.insert(personTable, person.toMap());

    return result;
  }

  Future<int> update(Person person) async {
    Database? db = await database;

    int result = await db!.update(
      personTable,
      person.toMap(),
      where: columnId,
      whereArgs: [person.id],
    );

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
}
