import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      home: MeuApp(),
    );
  }
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá Mundo Flutter"),
        leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTA-l3__C_BRBX_9qHhX4en4KhvTCbu0DTqr3sRj0nxdHl7jixa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Olá"),
          Text("Mundo"),
          Image.network("https://www.espm.br/wp-content/uploads/2018/10/sao-pos-prof-mba-executivo-mkt-ricardo_balestiero.jpg")
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("Ola Mundo Debug");
        },
        child: Icon( Icons.add_circle ),
      ),
    );
  }
}
