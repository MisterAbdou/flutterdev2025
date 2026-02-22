import 'package:carnet/services/authentification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccueilUser2 extends StatefulWidget {
  const AccueilUser2({super.key});

  @override
  State<AccueilUser2> createState() => _AccueilUser2State();
}

class _AccueilUser2State extends State<AccueilUser2> {
  final Authentification _auth = Authentification();
  String? _photoUrl;
  String _nomComplet = '';

  @override
  void initState() {
    super.initState();
    _chargerPatient();
  }

  Future<void> _chargerPatient() async {
    try {
      final user = _auth.utilisateurConnecte;
      if (user == null) return;

      final doc = await FirebaseFirestore.instance
          .collection('patients')
          .doc(user.uid)
          .get();

      if (doc.exists && mounted) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          _photoUrl = data['photo'];
          _nomComplet = "${data['prenom'] ?? ''} ${data['nom'] ?? ''}".trim();
        });
      }
    } catch (e) {
      print(" Erreur : $e");
    }
  }

  static const List<Map<String, dynamic>> sections = [
    {
      'titre': 'Antécédents\nmédicaux',
      'icone': Icons.medical_information,
      'route': '/antecedents_medicaux',
    },
    {
      'titre': 'Antécédents\nchirurgicaux',
      'icone': Icons.medical_services,
      'route': '/antecedents_chirurgicaux',
    },
    {
      'titre': 'Allergies',
      'icone': Icons.warning_amber_rounded,
      'route': '/allergies',
    },
    {'titre': 'Vaccins', 'icone': Icons.vaccines, 'route': '/vaccins'},
  ];

  Widget buildTuile(BuildContext context, Map<String, dynamic> section) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, section['route']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${section['titre'].replaceAll('\n', ' ')} sélectionné",
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.green[800],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[600],
          border: Border.all(color: Colors.green[800]!, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(section['icone'] as IconData, color: Colors.white, size: 28),
              const SizedBox(height: 10),
              Text(
                section['titre'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 12),

                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _photoUrl != null
                        ? NetworkImage(_photoUrl!)
                        : null,
                    child: _photoUrl == null
                        ? const Icon(Icons.person, color: Colors.grey, size: 24)
                        : null,
                  ),
                  const SizedBox(width: 10),

                  Text(
                    _nomComplet.isNotEmpty ? _nomComplet : "Accueil",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green[800]!, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                    itemCount: sections.length + 1,
                    itemBuilder: (context, index) {
                      if (index == sections.length) {
                        return Container(color: Colors.green[600]);
                      }
                      return buildTuile(context, sections[index]);
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
