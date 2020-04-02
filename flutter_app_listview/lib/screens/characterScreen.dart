import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapplistview/models/characterModel.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return _constroiTelaCharacter();
  }

  Widget _constroiTelaCharacter() {
    return Scaffold(
      appBar: _constroiAppBarCharacter(),
      body: _controisBodyCharacter(),
    );
  }

  _constroiAppBarCharacter() => AppBar(
    title: Text("Personagens", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
  );

  _controisBodyCharacter() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/character.json"),
      builder: (context, snapshot){
        List<dynamic> personagens = json.decode(snapshot.data.toString());
        return ListView.builder(
            itemBuilder: (context, index){
              Character character = Character.fromJson(personagens[index]);
              return _constroiLinhaCharacter(character.name, character.image, character.series);
            },
            itemCount: personagens == null ? 0 : personagens.length,
        );
      },
    );
  }

  _constroiLinhaCharacter(String name, String image, String series) {
    return Container(
      height: 300,
      child: Row(
        children: <Widget>[
          Expanded(child: Image.asset(image, fit: BoxFit.fill,)),
          Expanded(child: Center(child: Text("Name: ${name}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),))),
          Expanded(child: Text("Series: ${series}", style: TextStyle(fontSize: 14),)),
        ],
      ),
    );
  }
}
