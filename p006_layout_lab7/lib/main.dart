import 'package:flutter/material.dart';
import 'package:p006_layout_lab7/login_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* partie  mise en page
  Widget buildBox(_texte, _color) {
    return Container(
      height: 100,
      width: 200,
      color: _color,
      child: Center(child: Text(_texte, style: TextStyle(fontSize: 25))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("widget column"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBox("Box 1", Colors.greenAccent),
          buildBox("box 2", Colors.orangeAccent),
          buildBox("Box 3", Colors.redAccent),
          buildBox("Box 4", Colors.blueAccent),
        ],
      ),
    );
  }   */

  /*@override
   Widget build(BuildContext context) {
     return Scaffold(body: LoginPage());
   } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPage2());
  }
}
