import 'package:flutter/material.dart';
import 'package:flutterappnotas/databases/notes_dao.dart';
import 'package:flutterappnotas/models/note.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final NotesDao _dao = NotesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Note Title"),
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Note Text"),
              style: TextStyle(fontSize: 14.0),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Note note = Note(
            _textController.text ?? "No text",
            _titleController.text ?? "No tittle"
          );
          print(note);
          Navigator.of(context).pop(_dao.save(note));
        },
        child: Icon(Icons.check_box_outline_blank),
      ),
    );
  }
}
