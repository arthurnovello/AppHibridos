import 'package:flutterappnotas/databases/notes_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async{
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, "my_notes_bd");
  return openDatabase(path,
    onCreate: (db, version){
    db.execute(NotesDao.createTable);
    },
    version: 1,
  );
}