import 'package:carnet/models/user.dart';
import 'package:carnet/services/authentification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccueilMedecin extends StatefulWidget {
  const AccueilMedecin({super.key});

  @override
  State<AccueilMedecin> createState() => _AccueilMedecinState();
}

class _AccueilMedecinState extends State<AccueilMedecin> {
  final Authentification _auth = Authentification();

  UserMedecin? _medecin;
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

      final doc = await FirebaseFirestore.instance
          .collection('medecins')
          .doc(user.uid)
          .get();

      if (doc.exists && mounted) {
        setState(() {
          _medecin = UserMedecin.fromFirestore(
            doc.data() as Map<String, dynamic>,
            doc.id,
          );
          _isLoading = false;
        });
      } else {
        if (mounted) setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget buildCarteIdentite() {
    final nomPrenom = _medecin != null
        ? "${_medecin!.nom ?? ''} ${_medecin!.prenom ?? ''}"
        : '—';
    final specialite = _medecin?.specialite ?? 'Médecin';
    final photoUrl = _medecin?.photo;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.green.shade700, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomPrenom,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialite,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ],
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

  Widget buildQrCode() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 65, 137, 66),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Container(
          width: 250,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black),
          ),
          child: const Icon(Icons.qr_code_2, size: 200, color: Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
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
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          buildCarteIdentite(),
                          const SizedBox(height: 50),
                          buildQrCode(),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
