import 'package:flutter/material.dart';

import '../models/patient_model.dart';

class AddPatientsScreen extends StatefulWidget {
  const AddPatientsScreen({super.key});

  @override
  State<AddPatientsScreen> createState() => _AddPatientsScreenState();
}

class _AddPatientsScreenState extends State<AddPatientsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _ageController = TextEditingController();
  final _telephoneController = TextEditingController();

  String? _sexe;
  bool _actif = true;

  @override
  void dispose() {
    _nomController.dispose();
    _ageController.dispose();
    _telephoneController.dispose();
    super.dispose();
  }

  void _ajouterPatient() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_sexe == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner le sexe du patient.'),
        ),
      );
      return;
    }

    final patient = PatientModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      nom: _nomController.text.trim(),
      age: int.parse(_ageController.text.trim()),
      sexe: _sexe!,
      telephone: _telephoneController.text.trim(),
      actif: _actif,
    );

    // Pour le moment, les données restent locales.
    // La sauvegarde en base nécessitera une API ou un backend.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Formulaire validé pour ${patient.nom}. '
          'La sauvegarde en base reste à connecter.',
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    String? hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, color: const Color(0xFF2563EB)),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text(
          'Nouveau patient',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.person_add_alt_1,
                        size: 42,
                        color: Color(0xFF2563EB),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Informations du patient',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Renseignez les informations nécessaires '
                        'pour préparer le dossier du patient.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(height: 28),

                      TextFormField(
                        controller: _nomController,
                        textCapitalization: TextCapitalization.words,
                        decoration: _decoration(
                          label: 'Nom complet',
                          icon: Icons.person_outline,
                          hint: 'Ex. : Jean Dupont',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Veuillez saisir le nom du patient.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: _decoration(
                          label: 'Âge',
                          icon: Icons.calendar_today_outlined,
                          hint: 'Ex. : 25',
                        ),
                        validator: (value) {
                          final age = int.tryParse(value?.trim() ?? '');

                          if (age == null || age < 0 || age > 130) {
                            return 'Saisissez un âge valide entre 0 et 130.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      DropdownButtonFormField<String>(
                        initialValue: _sexe,
                        decoration: _decoration(
                          label: 'Sexe',
                          icon: Icons.wc_outlined,
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Masculin',
                            child: Text('Masculin'),
                          ),
                          DropdownMenuItem(
                            value: 'Féminin',
                            child: Text('Féminin'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() => _sexe = value);
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Veuillez sélectionner le sexe.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _telephoneController,
                        keyboardType: TextInputType.phone,
                        decoration: _decoration(
                          label: 'Téléphone',
                          icon: Icons.phone_outlined,
                          hint: 'Ex. : 06 123 45 67',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Veuillez saisir le numéro de téléphone.';
                          }
                          if (value.trim().length < 6) {
                            return 'Le numéro de téléphone est trop court.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Patient actif',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: const Text(
                          'Indique si le dossier est actuellement actif.',
                        ),
                        value: _actif,
                        activeTrackColor: const Color(0xFF2563EB),
                        onChanged: (value) {
                          setState(() => _actif = value);
                        },
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: _ajouterPatient,
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text(
                            'Valider le formulaire',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Annuler'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
