import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Horloge());
  }
}

class Horloge extends StatefulWidget {
  const Horloge({super.key});

  @override
  State<Horloge> createState() => _HorlogeState();
}

class _HorlogeState extends State<Horloge> {
  ElevatedButton buildStartButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.play_arrow, size: 25, color: Colors.white),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(100, 50),
      ),
    );
  }

  ElevatedButton buildPauseButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(Icons.pause, size: 25, color: Colors.white),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: Size(100, 50),
      ),
    );
  }

  Row buildLigneColonnes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [buildLigneColonnes(), buildPauseButton()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
