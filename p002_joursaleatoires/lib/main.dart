import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "jours aleatoire", home: JoursAleatoires());
  }
}

class JoursAleatoires extends StatefulWidget {
  const JoursAleatoires({super.key});

  @override
  State<JoursAleatoires> createState() => _JoursAleatoires();
}

class _JoursAleatoires extends State<JoursAleatoires> {
  List<String> joursDeLaSemaine = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche",
  ];
  int indexActuel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Application jours aleatoires")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "cliquez pour voir un nouveau jour",
              style: TextStyle(fontSize: 23, color: Colors.red),
            ),
            Text(
              joursDeLaSemaine[indexActuel],
              style: TextStyle(
                fontSize: 40,
                color: Colors.green[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  indexActuel = Random().nextInt(7);
                });
              },
              child: Text("generer un jours"),
            ),
          ],
        ),
      ),
    );
  }
}
