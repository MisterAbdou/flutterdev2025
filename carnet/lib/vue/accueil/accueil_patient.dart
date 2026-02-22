import 'package:carnet/models/information.dart';
import 'package:carnet/models/user.dart';
import 'package:carnet/services/authentification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccueilPatient extends StatefulWidget {
  const AccueilPatient({super.key});
  @override
  State<AccueilPatient> createState() => _AccueilPatientState();
}

class _AccueilPatientState extends State<AccueilPatient> {
  final Authentification _auth = Authentification();

  UserPatient? _patient;
  Information? _information;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _chargerDonnees();
  }

  Future<void> _chargerDonnees() async {
    try {
      final user = _auth.utilisateurConnecte;
      if (user == null) {
        setState(() => _isLoading = false);
        return;
      }

      final patientDoc = await FirebaseFirestore.instance
          .collection('patients')
          .doc(user.uid)
          .get();

      final infoDoc = await FirebaseFirestore.instance
          .collection('informations')
          .doc(user.uid)
          .get();

      if (mounted) {
        setState(() {
          if (patientDoc.exists) {
            _patient = UserPatient.fromFirestore(
              patientDoc.data() as Map<String, dynamic>,
              patientDoc.id,
            );
          }
          if (infoDoc.exists) {
            _information = Information.fromFirestore(
              infoDoc.data() as Map<String, dynamic>,
              infoDoc.id,
            );
          }
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget buildHeader() {
    final photoUrl = _patient?.photo;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: photoUrl != null
                  ? Image.network(
                      photoUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      },
                      errorBuilder: (_, __, ___) => _photoParDefaut(),
                    )
                  : _photoParDefaut(),
            ),
          ),
          // QR code
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.qr_code_2,
              size: 130,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoParDefaut() {
    return Container(
      color: Colors.grey[300],
      child: const Icon(Icons.person, size: 80, color: Colors.grey),
    );
  }

  Widget _ligneInfo(String label, String valeur) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label : ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Expanded(child: Text(valeur, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _choixMultiple(
    String label,
    List<String> options,
    String valeurActive,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label : ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          ...options.map(
            (opt) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: opt == valeurActive,
                  onChanged: (_) {},
                  activeColor: const Color.fromARGB(255, 65, 137, 66),
                ),
                Text(opt, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget informationPatient() {
    final nom = _patient?.nom ?? '—';
    final prenom = _patient?.prenom ?? '—';
    final date = _patient?.dateNaissance ?? '—';
    final taille = _information?.taille ?? 0.0;
    final poids = _information?.poids ?? 0.0;
    final gSanguin = _information?.groupeSanguin ?? '—';
    final sexe = _information?.sexe ?? '—';
    final civilite = _information?.situationFamiliale ?? '—';
    final fumeur = _information?.fumeur ?? false;
    final nbCigarette = _information?.nbCigarette ?? 0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 65, 137, 66),
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ligneInfo("Nom", nom),
          const Divider(height: 1, color: Colors.white),
          _ligneInfo("Prénom", prenom),
          const Divider(height: 1, color: Colors.white),
          _ligneInfo("Né(e) le", date),
          const Divider(height: 1, color: Colors.white),
          Row(
            children: [
              Expanded(child: _ligneInfo("Taille", "${taille}m")),
              Expanded(child: _ligneInfo("Poids", "${poids}kg")),
            ],
          ),
          const Divider(height: 1, color: Colors.white),
          _ligneInfo("Groupe Sanguin", gSanguin),
          const Divider(height: 1, color: Colors.white),
          _choixMultiple("Sexe", ["F", "M"], sexe),
          const Divider(height: 1, color: Colors.white),
          _choixMultiple("Situation familiale", [
            "Célibataire",
            "Marié(e)",
          ], civilite),
          const Divider(height: 1, color: Colors.white),
          _choixMultiple("Fumeur", ["OUI", "NON"], fumeur ? "OUI" : "NON"),
          if (fumeur)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "Nombre de cigarettes par jour : $nbCigarette",
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/accueilUser2'),
              icon: const Icon(
                Icons.folder_open,
                color: Color.fromARGB(255, 65, 137, 66),
              ),
              label: const Text(
                "Voir mon dossier médical",
                style: TextStyle(
                  color: Color.fromARGB(255, 65, 137, 66),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 137, 66),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 120),
                  const Text(
                    "Accueil",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            buildHeader(),

            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: informationPatient(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
