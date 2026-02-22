// import 'package:carnet/connexion.dart';
import 'package:carnet/vue/accueil/accueil_medecin.dart';
import 'package:carnet/vue/accueil/accueil_patient.dart';
import 'package:carnet/vue/accueil/accueil_patient_suite.dart';
import 'package:carnet/vue/connexion/connexion.dart';
import 'package:carnet/vue/connexion/connexion_inscription.dart';
import 'package:carnet/vue/inscription/inscription_medecin.dart';
import 'package:carnet/vue/inscription/inscription_patient.dart';
// import 'package:carnet/inscription_patient.dart';
import 'package:carnet/vue/ouverture/ouverture.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.light()),
      initialRoute: '/ouverture',
      routes: {
        "/ouverture": (context) => const Ouverture(),
        '/login': (context) => const ConnexionInscription(),
        '/connexion': (context) => const Connexion(),
        '/inscriptPatient': (context) => const InscriptionPatient(),
        '/inscriptMedecin': (context) => const InscriptionMedecin(),
        '/accueilPatient': (context) => const AccueilPatient(),
        '/accueilMedecin': (context) => const AccueilMedecin(),
        '/accueilUser2': (context) => const AccueilUser2(),
      },
    );
  }
}
