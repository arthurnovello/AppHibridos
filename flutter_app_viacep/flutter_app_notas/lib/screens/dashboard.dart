import 'package:flutter/material.dart';
import 'package:flutterappnotas/databases/notes_dao.dart';
import 'package:flutterappnotas/models/note.dart';
import 'package:flutterappnotas/screens/add_note.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final NotesDao _dao = NotesDao();

  @override
  Widget build(BuildContext context) {
    return _constroiDashboard();
  }

  _constroiDashboard() {
    return Scaffold(
      appBar: AppBar(title: Text("Notas"),),
      body: FutureBuilder(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Loading"),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
            // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Note> notes = snapshot.data;
              return ListView.builder(itemCount: notes == null ? 0: notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(notes[index].titulo,
                          style: TextStyle(fontSize: 24.0)),
                      subtitle: Text(notes[index].titulo,
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  );
                },);
              break;
          }
          return Text("Texto inesperado");
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
