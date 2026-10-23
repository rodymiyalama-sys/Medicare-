import 'package:flutter/material.dart';

/// =====================================================
/// WIDGET RÉSUMÉ PATIENT
///
/// Carte affichée dans l'onglet Résumé
/// =====================================================
class PatientResumeWidget extends StatelessWidget {
  const PatientResumeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          /// =====================================
          /// TITRE
          /// =====================================
          const Text(
            "Résumé",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          /// DERNIER DIAGNOSTIC
          _resumeItem(
            "Dernier diagnostic",
            "Hypertension artérielle",
          ),

          const Divider(),

          /// MALADIES
          _resumeItem(
            "Maladies chroniques",
            "Diabète type 2",
          ),

          const Divider(),

          /// TRAITEMENT
          _resumeItem(
            "Traitement actuel",
            "Metformine",
          ),

          const Divider(),

          /// PROCHAIN RDV
          _resumeItem(
            "Prochain rendez-vous",
            "15 Juin 2026",
          ),

          const Divider(),

          /// ASSURANCE
          _resumeItem(
            "Assurance",
            "CNSS",
          ),
        ],
      ),
    );
  }

  Widget _resumeItem(
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),

      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
            ),
          ),

          Text(
            value,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}