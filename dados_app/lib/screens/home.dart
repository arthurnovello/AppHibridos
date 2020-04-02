import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: _HomeAppBar(),
   backgroundColor: Colors.blueAccent,
   body: _HomeBody(),
  );
 }

  _HomeAppBar() {
   return AppBar(
    title: Text("Roda DAdos"),
   );
  }

  _HomeBody() {
  return Row(
   children: <Widget>[
    _CreateDiceImage(_dice1),
    _CreateDiceImage(_dice2),
   ],
  );
  }

  _CreateDiceImage(displayAsset) {
   return Expanded(child: Image.asset(displayAsset));
  }

  final String _dice1 = 'assets/images/dice1.png';
  final String _dice2 = 'assets/images/dice2.png';
  final String _dice3 = 'assets/images/dice3.png';
  final String _dice4 = 'assets/images/dice4.png';
  final String _dice5 = 'assets/images/dice5.png';
  final String _dice6 = 'assets/images/dice6.png';
}