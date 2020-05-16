import 'package:flutterappnotas/databases/app_database.dart';
import 'package:flutterappnotas/models/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesDao {
  static const String createTable = "CREATE TABLE $tableName("
      '$id INTEGER PRIMARY KEY, '
      '$title TEXT, '
      '$noteText TEXT)';
  static const String tableName = "notes";
  static const String id = 'id';
  static const String title = 'title';
  static const String noteText = 'noteText';

  Future<int> save(Note note) async{
    final Database db = await createDatabase();
    final Map<String, dynamic> noteMap = Map();
    noteMap[title] = note.titulo;
    noteMap[noteText] = note.texto;
    return db.insert(tableName, noteMap);
  }

  Future<List<Note>> findAll() async{
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> results = await db.query(tableName);
    final List<Note> notes = List();
    for(Map<String, dynamic> map in results){
      final Note note = Note(
        map[noteText],
        map[title],
        id:map[id],
      );
      notes.add(note);
    }
    return notes;
  }
}
