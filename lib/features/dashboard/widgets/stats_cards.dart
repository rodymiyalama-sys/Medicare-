import 'package:flutter/material.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      /// 5 cartes sur desktop
      crossAxisCount: 5,

      crossAxisSpacing: 20,
      mainAxisSpacing: 20,

      /// Taille des cartes
      childAspectRatio: 0.90,

      children: [

        /// ==========================
        /// CARTE PATIENTS
        /// ==========================
        _StatCard(
          icon: Icons.people,
          title: "Patients",
          value: "128",
          percent: "+12%",
          subtitle: "vs Hier",
          color: const Color(0xFF2563EB),

          /// Navigation vers Patients
          onTap: () {
            Navigator.pushNamed(
              context,
              '/patients',
            );
          },
        ),

        /// ==========================
        /// CARTE RENDEZ-VOUS
        /// ==========================
        _StatCard(
          icon: Icons.calendar_month,
          title: "Rendez-vous",
          value: "45",
          percent: "+8%",
          subtitle: "vs Hier",
          color: const Color(0xFF2563EB),

          /// Navigation vers Rendez-vous
          onTap: () {
            Navigator.pushNamed(
              context,
              '/appointments',
            );
          },
        ),

        /// ==========================
        /// CARTE ADMISSIONS
        /// ==========================
        _StatCard(
          icon: Icons.local_hospital,
          title: "Admissions",
          value: "18",
          percent: "+5%",
          subtitle: "vs Hier",
          color: const Color(0xFF22C55E),

          /// Navigation vers Admissions
          onTap: () {
            Navigator.pushNamed(
              context,
              '/admissions',
            );
          },
        ),

        /// ==========================
        /// CARTE CHAMBRES
        /// ==========================
        _StatCard(
          icon: Icons.bed,
          title: "Chambres",
          value: "85/120",
          percent: "70.8%",
          subtitle: "",
          color: const Color(0xFF2563EB),

          /// Navigation vers Chambres
          onTap: () {
            Navigator.pushNamed(
              context,
              '/rooms',
            );
          },
        ),

        /// ==========================
        /// CARTE MÉDECINS
        /// ==========================
        _StatCard(
          icon: Icons.person_outline,
          title: "Médecins",
          value: "32",
          percent: "En service",
          subtitle: "",
          color: const Color(0xFF22C55E),

          /// Navigation vers Médecins
          onTap: () {
            Navigator.pushNamed(
              context,
              '/doctors',
            );
          },
        ),
      ],
    );
  }
}

/// =====================================
/// WIDGET D'UNE CARTE STATISTIQUE
/// =====================================
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String percent;
  final String subtitle;
  final Color color;

  /// Fonction exécutée au clic
  final VoidCallback onTap;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.percent,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(

      /// Action lorsqu'on clique sur la carte
      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Container(
        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

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

            /// Icône de la carte
            Icon(
              icon,
              color: color,
              size: 28,
            ),

            const Spacer(),

            /// Valeur principale
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            /// Titre
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 10),

            /// Pourcentage
            Text(
              percent,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            /// Sous-titre
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
          ],
        ),
      ),
    );
  }
}