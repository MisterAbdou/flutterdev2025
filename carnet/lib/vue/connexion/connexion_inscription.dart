// import 'package:carnet/connexion.dart';
import 'package:flutter/material.dart';

class ConnexionInscription extends StatefulWidget {
  const ConnexionInscription({super.key});

  @override
  State<ConnexionInscription> createState() => _ConnexionInscriptionState();
}

class _ConnexionInscriptionState extends State<ConnexionInscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(12),

        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/LogoMED.jpg", width: 250, height: 100),

            Text(
              "Sama Carnet",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
            const SizedBox(height: 3),
            Text(
              "veuillez se connecter pour voir toutes les informations sur votre page",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: const Color.fromARGB(255, 65, 137, 66),
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),

              onPressed: () => Navigator.pushNamed(context, '/connexion'),
              child: Text(
                "Se connecter",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: const Color.fromARGB(255, 65, 137, 66),
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),

              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 65, 137, 66),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                          ),

                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/inscriptPatient',
                            ); // fermer le dialog
                          },
                          child: const Text(
                            "Patients",
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 137, 66),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/inscriptMedecin');
                          },
                          child: const Text(
                            "Medecin",
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 137, 66),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("S'inscrire", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
