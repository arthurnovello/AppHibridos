import 'package:flutter/material.dart';
import 'package:flutterappsqlitedogs/databases/app_database.dart';
import 'package:flutterappsqlitedogs/models/dog.dart';
import 'package:flutterappsqlitedogs/screens/input_dog.dart';

class HomeScreen extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return _construirHome(context);
  }

  Widget _construirHome(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(),
      body: _homeBody(),
      floatingActionButton: _homeFAB(context),
    );
  }

  _homeAppBar() {
    return AppBar(
      title: Text("Dogs List"),
    );
  }

  _homeBody() {
    return FutureBuilder(
      initialData: List(),
      future: findAll(),
      builder: (context, snapshot) {
        if (snapshot != null) {
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
                    Text("Loading..."),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Dog> dogs = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(dogs[index].name),
                    subtitle: Text("${dogs[index].age}"),
                  ),
                ),
                itemCount: dogs.length,
              );
              break;
          }
        }
        return Text("#N/A");
      },
    );
  }

  _homeFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InputDog()));
      },
      child: Icon(Icons.add),
    );
  }
}
