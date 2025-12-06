import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // widget l'alignement en ligne pour les boutons
  Widget buildRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Icon(Icons.settings, color: Colors.white),
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(Icons.phone, color: Colors.white),
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.grey,
          child: Icon(Icons.camera, color: Colors.black),
        ),
      ],
    );
  }

  Widget buildColumnButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {},
          child: const Icon(Icons.settings, color: Colors.white),
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: const Icon(Icons.phone, color: Colors.white),
        ),
        const SizedBox(height: 5),
        FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {},
          child: const Icon(Icons.camera, color: Colors.black),
        ),
      ],
    );
  }

  Widget builBox(String texte, double height, double width, Color color) {
    return Container(
      color: color,
      padding: EdgeInsets.all(5),
      height: height,
      width: width,
      child: Text(
        texte,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Widget Stack"),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 241, 213, 213),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: builBox("box 1", 300, 300, Colors.greenAccent),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: builBox("box 2", 250, 250, Colors.redAccent),
          ),
          Align(
            alignment: Alignment.topRight,
            child: builBox("box 3", 200, 200, Colors.orangeAccent),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: builBox("box 4", 150, 150, Colors.blueAccent),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: buildColumnButton(),
            ),
          ),
        ],
      ),
    );
  }
}
