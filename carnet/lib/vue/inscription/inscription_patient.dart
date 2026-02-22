import 'package:carnet/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class InscriptionPatient extends StatefulWidget {
  const InscriptionPatient({super.key});

  @override
  State<InscriptionPatient> createState() => _InscriptionPatientState();
}

class _InscriptionPatientState extends State<InscriptionPatient> {
  final AuthController _controller = AuthController();
  bool _isLoading = false;

  File? _photoChoisie;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _choisirPhoto() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choisir une photo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: Color.fromARGB(255, 65, 137, 66),
              ),
              title: const Text("Depuis la galerie"),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 70,
                );
                if (image != null) {
                  setState(() => _photoChoisie = File(image.path));
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.camera_alt,
                color: Color.fromARGB(255, 65, 137, 66),
              ),
              title: const Text("Depuis la caméra"),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 70,
                );
                if (image != null) {
                  setState(() => _photoChoisie = File(image.path));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonPhoto() {
    return GestureDetector(
      onTap: _choisirPhoto,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: _photoChoisie != null
            ? Row(
                children: [
                  const SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _photoChoisie!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Photo sélectionnée ✓",
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 137, 66),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.edit, color: Colors.grey),
                  const SizedBox(width: 8),
                ],
              )
            : Row(
                children: const [
                  SizedBox(width: 12),
                  Icon(Icons.add_a_photo, color: Colors.black54, size: 28),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Cliquer pour inserer votre photo d'identite",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ],
              ),
      ),
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
        textStyle: TextStyle(fontSize: sizetext, fontWeight: FontWeight.w500),
        iconSize: 30,
        iconColor: colorIcon,
      ),
      onPressed: _isLoading
          ? null
          : () async {
              if (valeur == 1) {
                setState(() => _isLoading = true);
                try {
                  await _controller.inscrirePatient();
                  if (mounted) _afficherSucces();
                } catch (e) {
                  if (mounted) _afficherErreur(e.toString());
                } finally {
                  if (mounted) setState(() => _isLoading = false);
                }
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
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(myIcon),
          prefixIconColor: Colors.blue,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  void _afficherSucces() {
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
            "votre demande a ete pris en compte",
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
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/connexion',
                  (route) => false,
                );
              },
              child: const Text(
                "Aller a la page connexion",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 80),
                    const Text(
                      "inscription",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              buildInput(
                "Donner votre nom",
                Icons.person,
                _controller.nomController,
              ),
              const SizedBox(height: 15),

              buildInput(
                "Donner votre prenom",
                Icons.person,
                _controller.prenomController,
              ),
              const SizedBox(height: 15),

              buildInput(
                "Donner votre data de naissance",
                Icons.calendar_month,
                _controller.dateNaissanceController,
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Cliquer pour inserer votre certificat naissance",
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 137, 66),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              buildInput(
                "Donner votre e-mail",
                Icons.email,
                _controller.emailController,
              ),
              const SizedBox(height: 15),

              buildInput(
                "Donner votre mot de passe",
                Icons.lock_outline,
                _controller.motDePasseController,
                isPassword: true,
              ),
              const SizedBox(height: 15),

              buildInput(
                "Confirmer votre mot de passe",
                Icons.lock_outline,
                _controller.confirmMotDePasseController,
                isPassword: true,
              ),
              const SizedBox(height: 15),
              buildButtonPhoto(),
              const SizedBox(height: 15),

              buildButton(
                Colors.white,
                50,
                "S'inscrire",
                const Color.fromARGB(255, 65, 137, 66),
                null,
                25,
                70,
                null,
                1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
