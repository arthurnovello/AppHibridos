import 'package:flutter/material.dart';
import 'package:flutterappsqlitedogs/databases/app_database.dart';
import 'package:flutterappsqlitedogs/models/dog.dart';

class InputDog extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _construirInputDog(context);
  }

  Widget _construirInputDog(BuildContext context) {
    return Scaffold(
      appBar: _construirInputDogAppBar(),
      body: _construirInputDogBody(context),
    );
  }

  _construirInputDogAppBar() {
    return AppBar(title: Text("New Dog"),);
  }

  _construirInputDogBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
                labelText: "Name: "
            ),
          ),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(
                labelText: "Age: "
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            width: double.maxFinite,
            child:  RaisedButton(
              onPressed: () async{
                final String name = _nameController.text;
                final int age = int.tryParse(_ageController.text);
                if(name != null && age != null){
                  final Dog dog = Dog(name, age);
                  int id = await save(dog);
                  Navigator.pop(context);
                }
              },
              child: Text("Confirm Add"),
            ),
          ),
        ],
      ),
    );


  }
}
