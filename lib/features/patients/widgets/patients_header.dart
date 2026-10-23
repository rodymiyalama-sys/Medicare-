import 'package:flutter/material.dart';

class PatientsHeader extends StatelessWidget {
  const PatientsHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(

      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        /// TITRES
        const Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Text(
              "Patients",

              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),

            SizedBox(height: 6),

            Text(
              "Tous les patients (128)",

              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),

        /// BOUTON AJOUT
        ElevatedButton.icon(

          onPressed: () {

            Navigator.pushNamed(
              context,
              '/add-patient',
            );
          },

          icon: const Icon(Icons.add),

          label: const Text(
            "Nouveau patient",
          ),

          style: ElevatedButton.styleFrom(

            backgroundColor:
            const Color(0xFF2563EB),

            foregroundColor:
            Colors.white,

            elevation: 0,

            padding:
            const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 18,
            ),

            shape:
            RoundedRectangleBorder(

              borderRadius:
              BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );
  }
}