import 'package:flutter/material.dart';

/// =====================================================
/// CARTE INFORMATIONS MÉDICALES
///
/// Partie droite de la page Détails Patient
/// =====================================================
class PatientMedicalInfoCard extends StatelessWidget {
  const PatientMedicalInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      /// ESPACEMENT INTERNE
      padding: const EdgeInsets.all(24),

      /// DESIGN DE LA CARTE
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
            "Informations médicales",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          /// =====================================
          /// GROUPE SANGUIN
          /// =====================================
          _medicalItem(
            Icons.bloodtype,
            "Groupe sanguin",
            "O+",
          ),

          const Divider(),

          /// =====================================
          /// ALLERGIES
          /// =====================================
          _medicalItem(
            Icons.warning_amber_rounded,
            "Allergies",
            "Pénicilline",
          ),

          const Divider(),

          /// =====================================
          /// POIDS
          /// =====================================
          _medicalItem(
            Icons.monitor_weight_outlined,
            "Poids",
            "75 kg",
          ),

          const Divider(),

          /// =====================================
          /// TAILLE
          /// =====================================
          _medicalItem(
            Icons.height,
            "Taille",
            "1.78 m",
          ),

          const Divider(),

          /// =====================================
          /// MEDECIN REFERENT
          /// =====================================
          _medicalItem(
            Icons.medical_services_outlined,
            "Médecin référent",
            "Dr. Martin",
          ),

          const Divider(),

          /// =====================================
          /// DERNIERE VISITE
          /// =====================================
          _medicalItem(
            Icons.calendar_month,
            "Dernière visite",
            "12/06/2026",
          ),
        ],
      ),
    );
  }

  /// =====================================================
  /// WIDGET REUTILISABLE
  /// =====================================================
  Widget _medicalItem(
      IconData icon,
      String title,
      String value,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),

      child: Row(
        children: [

          /// ICONE
          Icon(
            icon,
            color: const Color(0xFF2563EB),
          ),

          const SizedBox(width: 12),

          /// LIBELLE
          Expanded(
            child: Text(
              title,
            ),
          ),

          /// VALEUR
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