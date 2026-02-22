import 'package:carnet/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final AuthController _controller = AuthController();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _connecter() async {
    setState(() => _isLoading = true);
    try {
      Map<String, dynamic> result = await _controller.connecter();

      if (mounted) {
        if (result['role'] == 'patient') {
          _afficherSucces('/accueilPatient');
        } else {
          _afficherSucces('/accueilMedecin');
        }
      }
    } catch (e) {
      if (mounted) _afficherErreur(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _afficherSucces(String route) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: Color.fromARGB(255, 65, 137, 66),
            size: 75,
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Bienvenue dans Sama Carnet",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          content: const Text(
            "Encore une fois , votre connexion a ete valide dans sama carnet",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 65, 137, 66),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
              },
              child: const Text(
                "Aller a la page d'accueil",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _afficherErreur(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red, size: 60),
          title: const Text("Erreur"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "OK",
                style: TextStyle(color: Color.fromARGB(255, 65, 137, 66)),
              ),
            ),
          ],
        );
      },
    );
  }

  ElevatedButton buildButton(
    Color couleur,
    double larg,
    String txt,
    Color bgcolor,
    Color? colorIcon,
    double sizetext,
    double espace,
    IconData? myIcon,
    int valeur,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, larg),
        backgroundColor: bgcolor,
        padding: const EdgeInsets.only(top: 12, left: 8, bottom: 10, right: 8),
        textStyle: TextStyle(fontSize: sizetext, fontWeight: FontWeight.w600),
        iconSize: 30,
        iconColor: colorIcon,
      ),
      onPressed: _isLoading
          ? null
          : () {
              if (valeur == 1) {
                _connecter();
              }
            },
      child: valeur == 1 && _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Row(
              children: [
                Icon(myIcon),
                SizedBox(width: espace),
                Text(txt, style: TextStyle(color: couleur)),
              ],
            ),
    );
  }

  Container buildInput(
    String text,
    IconData myIcon,
    Color couleur,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: couleur),
          prefixIcon: Icon(myIcon),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const SizedBox(width: 65),
                  const Text(
                    "Connexion",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            buildInput(
              "Donner votre email..............",
              Icons.email_outlined,
              Colors.black,
              _controller.emailConnexionController,
            ),
            const SizedBox(height: 15),

            buildInput(
              "Donner votre mot de passe........",
              Icons.lock_outlined,
              Colors.black,
              _controller.motDePasseConnexionController,
              isPassword: true,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "mot de passe oublie?",
                style: TextStyle(
                  color: Color.fromARGB(255, 65, 137, 66),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),

            buildButton(
              Colors.white,
              50,
              "Se connecter",
              const Color.fromARGB(255, 65, 137, 66),
              null,
              25,
              50,
              null,
              1,
            ),
            const SizedBox(height: 5),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "vous n'avez pas de compte?S'inscrire",
                style: TextStyle(
                  color: Color.fromARGB(255, 65, 137, 66),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.end,
              ),
            ),

            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 13, 14, 13),
              ),
            ),
            const SizedBox(height: 40),

            buildButton(
              Colors.black,
              50,
              "S'inscrire avec Google",
              Colors.grey.shade200,
              Colors.red,
              18,
              40,
              FontAwesomeIcons.google,
              0,
            ),
            const SizedBox(height: 20),

            buildButton(
              Colors.black,
              50,
              "S'inscrire avec Apple",
              Colors.grey.shade200,
              Colors.black,
              18,
              40,
              Icons.apple_rounded,
              0,
            ),
            const SizedBox(height: 20),

            buildButton(
              Colors.black,
              50,
              "S'inscrire avec Facebook",
              Colors.grey.shade200,
              const Color.fromARGB(255, 19, 98, 163),
              18,
              40,
              Icons.facebook_outlined,
              0,
            ),
          ],
        ),
      ),
    );
  }
}
