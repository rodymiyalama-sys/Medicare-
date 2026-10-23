import 'package:flutter/material.dart';

/// =====================================================
/// STATISTIQUES DU PATIENT
///
/// Carte affichée à droite dans l'onglet Résumé
/// =====================================================
class PatientStatsWidget extends StatelessWidget {
  const PatientStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// =====================================
          /// TITRE
          /// =====================================
          const Text(
            "Statistiques",

            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 25),

          /// CONSULTATIONS
          _statCard(Icons.medical_services, "Consultations", "24", Colors.blue),

          const SizedBox(height: 15),

          /// ORDONNANCES
          _statCard(Icons.description, "Ordonnances", "12", Colors.green),

          const SizedBox(height: 15),

          /// FACTURES
          _statCard(Icons.receipt_long, "Factures", "8", Colors.orange),

          const SizedBox(height: 15),

          /// HOSPITALISATIONS
          _statCard(Icons.local_hospital, "Hospitalisations", "3", Colors.red),
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),

        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Icon(icon, color: color),

          const SizedBox(width: 12),

          Expanded(child: Text(title)),

          Text(
            value,

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
