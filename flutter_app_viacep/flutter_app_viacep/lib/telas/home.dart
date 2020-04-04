import 'package:flutter/material.dart';
import 'package:flutterappviacep/model/cep.dart';
import 'package:flutterappviacep/utilities/network_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final textFieldController = TextEditingController();
  var _dadosRecebidos = "";

  @override
  Widget build(BuildContext context) {
    return _constroiHomeScreen();
  }

  Widget _constroiHomeScreen() {
    return Scaffold(
      appBar: _constroiHomeScreenAppBar(),
      body: _constroiHomeScreenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var helper = NetworkHelper(url : "https://viacep.com.br/ws/${textFieldController.text}/json");
          var dados = await helper.getData();
          Cep cep = Cep.fromJson(dados);
         setState(() {
           _dadosRecebidos = cep.toString();
         });
        },
        child: Icon(Icons.search),
      ),
    );
  }

  _constroiHomeScreenAppBar() {
    return AppBar(title: Text("Consultas de Cep"),);
  }

  _constroiHomeScreenBody() {
    return Column(
      children: <Widget>[
        TextField( controller: textFieldController,),
        Text(_dadosRecebidos),
      ],
    );
  }
}
