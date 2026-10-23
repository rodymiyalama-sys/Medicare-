import 'package:flutter/material.dart';

/// Widget qui affiche les alertes du tableau de bord
class AlertsWidget extends StatelessWidget {
  const AlertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Hauteur du bloc d'alertes
            height: 400,
      // Espacement intérieur
      padding: const EdgeInsets.all(20),

      // Style du conteneur
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        // Ombre du conteneur
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),

      // Liste verticale des éléments
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// =====================================
          /// TITRE
          /// =====================================
          const Text(
            "Alertes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Espace en haut
          const SizedBox(height: 20),

          // ==========================
          // ALERTE 1
          // ==========================
          _alertCard(
            Icons.warning_amber_rounded,
            Colors.orange,
            "Chambre 206",
            "Nettoyage en attente",
            "10:15",
          ),

          const SizedBox(height: 10),

          // ==========================
          // ALERTE 2
          // ==========================
          _alertCard(
            Icons.warning,
            Colors.red,
            "Stock faible : Paracétamol",
            "(Boîte de 20)",
            "09:45",
          ),

          const SizedBox(height: 10),

          // ==========================
          // ALERTE 3
          // ==========================
          _alertCard(
            Icons.info,
            Colors.blue,
            "Rendez-vous",
            "Dr. Dubois dans 15 min",
            "10:00",
          ),

          // Pousse le bouton vers le bas
          const Spacer(),

          // Bouton pour voir toutes les alertes
          Center(
            child: TextButton(
              onPressed: () {
                // Navigation vers la page des alertes
                Navigator.pushNamed(context, '/alerts');
              },

              child: const Text(
                "Voir toutes les alertes",

                style: TextStyle(
                  color: Color(0xFF2563EB),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget réutilisable pour afficher une alerte
  Widget _alertCard(
      IconData icon,
      Color color,
      String title,
      String subtitle,
      String time,
      ) {
    return Container(
      // Espacement intérieur de la carte
      padding: const EdgeInsets.all(12),

      // Style de la carte
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [

          // Icône de l'alerte
          Icon(
            icon,
            color: color,
            size: 24,
          ),

          const SizedBox(width: 12),

          // Partie texte de l'alerte
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Titre de l'alerte
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Description de l'alerte
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Heure de l'alerte
          Text(
            time,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}