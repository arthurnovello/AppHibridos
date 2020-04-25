import 'package:flutterappsqlitedogs/models/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  var dbPath = await getDatabasesPath();
  final path = join(dbPath, "dogs_bank.db");
  return await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute("CREATE TABLE dogs("
          "id INTEGER PRIMARY KEY,"
          "name TEXT, "
          "age INTEGER)");
    },
    version: 1,
//    onDowngrade: onDatabaseDowngradeDelete,
    onUpgrade: (db, oldVersion, newVersion){
      db.execute("DROP TABLE IF EXISTS dogs");
    }
  );
}

Future<int> save(Dog dog) async {
  var db = await getDataBase();
  final Map<String, dynamic> dogMap = Map();
  dogMap['name'] = dog.name;
  dogMap['age'] = dog.age;
  return await db.insert("dogs", dogMap);
}

Future<List> findAll() async {
  var db = await getDataBase();
  final List<Dog> dogsList = List();
  var dogs = await db.query("dogs");
  for (Map<String, dynamic> dog in dogs) {
    dogsList.add(Dog(
      dog['name'],
      dog['age'],
      id: dog['id'],
    ));
  }
  return dogsList;
}
