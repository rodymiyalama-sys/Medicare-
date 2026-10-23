import 'package:flutter/material.dart';

class RecentAppointmentWidget extends StatelessWidget {
  const RecentAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,

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
        /// TITRE + VOIR TOUT
        /// =====================================///
          const Text(
            "Rendez-vous récents",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _appointment(
            "Miyalama martin",
            "Cardiologie",
            "10h30",
          ),

          const Divider(),

          _appointment(
            "Nkengue Dalia",
            "Pédiatrie",
            "11h15",
          ),

          const Divider(),

          _appointment(
            "Paul Ndzi",
            "Neurologie",
            "13h00",
          ),

          const Divider(),

          _appointment(
            "Miyalama Marta",
            "Ophtalmologue",
            "12h15",
          ),

          /// =====================================
          /// BOUTON VOIR TOUS LES RENDEZ-VOUS
          ///
          /// Ouvre la page contenant la liste
          /// complète des rendez-vous
          /// =====================================
          Center(
            child: TextButton(
              onPressed: () {

                /// Navigation vers
                /// l'écran des rendez-vous
                Navigator.pushNamed(
                  context,
                  '/appointments',
                );
              },

              child: const Text(
                "Voir tous les rendez-vous",

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2563EB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appointment(
      String patient,
      String service,
      String time,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFF1F5F9),
            child: Text(
              patient[0],
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  patient,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  service,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }
}