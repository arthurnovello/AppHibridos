import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapplistview/models/planetModel.dart';

class PlanetScreen extends StatefulWidget {
  @override
  _PlanetScreenState createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
  @override
  Widget build(BuildContext context) {
    return _constroiTelaPlanet();
  }

  Widget _constroiTelaPlanet() {
    return Scaffold(
      body: _constroiBodyPlanet(),
      appBar: _constroiAppBarPlanet(),
    );
  }

  _constroiAppBarPlanet() {
    return AppBar(
      title: Text("Planetas", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),),
    );
  }

  _constroiBodyPlanet() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/planet.json'),
      builder: (context, snapshot){
        List<dynamic> planetas = json.decode(snapshot.data.toString());
        return ListView.builder(
            itemBuilder: (context, index){
              Planet planeta = Planet.fromJson(planetas[index]);
              return _construirLinhaPlanet(planeta.name, planeta.image);
            },
            itemCount: planetas == null ? 0 : planetas.length,
        );
      },
    );
  }

  Widget _construirLinhaPlanet(String name, String image) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 300,
      child: Row(
        children: <Widget>[
          Expanded(child: Image.asset(image, fit: BoxFit.fill,)),
          Expanded(child: Center(child: Text(name, style: TextStyle(fontSize: 18),)))
        ],
      ),
    );
  }
}
