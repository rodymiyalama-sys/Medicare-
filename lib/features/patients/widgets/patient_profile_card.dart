import 'package:flutter/material.dart';

class PatientProfileCard extends StatelessWidget {
  const PatientProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),

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
        children: [

          /// PHOTO
          const CircleAvatar(
            radius: 55,

            backgroundColor:
            Color(0xFFE2E8F0),

            child: Icon(
              Icons.person,
              size: 60,
              color: Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 20),

          /// NOM
          const Text(
            "Jean Dupont",

            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "PAT-2024-00125",

            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          _info(
            Icons.cake_outlined,
            "Âge",
            "65 ans",
          ),

          const Divider(),

          _info(
            Icons.phone_outlined,
            "Téléphone",
            "+242 06 123 45 67",
          ),

          const Divider(),

          _info(
            Icons.email_outlined,
            "Email",
            "jean@email.com",
          ),

          const Divider(),

          _info(
            Icons.location_on_outlined,
            "Adresse",
            "Brazzaville",
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: Colors.green.shade100,

              borderRadius:
              BorderRadius.circular(30),
            ),

            child: const Text(
              "Patient actif",

              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(
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

          Icon(
            icon,
            color: const Color(0xFF2563EB),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(title),
          ),

          Text(
            value,

            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}