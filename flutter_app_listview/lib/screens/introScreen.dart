import 'package:flutter/material.dart';
import 'package:flutterapplistview/models/characterModel.dart';
import 'package:flutterapplistview/screens/characterScreen.dart';
import 'package:flutterapplistview/screens/planetScreen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _constroiIntroOpcoes(context);
  }

  Widget _constroiIntroOpcoes(context) {
    return Scaffold(
      appBar: _constroiIntroAppBar(),
      body: _constroiIntroBody(context),
    );
  }

  _constroiIntroAppBar() {
    return AppBar(
      title: Text("Escolha A Opção Desejada"),
    );
  }

  _constroiIntroBody(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => PlanetScreen()
              ));
            },
            icon: Icon(Icons.network_cell),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => CharacterScreen()
                  ));
            },
            icon: Icon(Icons.adb),
          ),
        ),
      ],
    );
  }
}
