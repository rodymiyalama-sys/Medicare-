import 'package:flutter/material.dart';

/// =====================================================
/// MENU ACTIONS PATIENT
///
/// Les 3 points du tableau
/// =====================================================
class PatientActionMenu extends StatelessWidget {
  const PatientActionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(

      icon: const Icon(
        Icons.more_vert,
      ),

      onSelected: (value) {

        /// OUVRIR DETAILS PATIENT
        if (value == "details") {

          Navigator.pushNamed(
            context,
            '/patient-details',
          );
        }
      },

      itemBuilder: (context) => [

        /// DETAILS PATIENT
        const PopupMenuItem(

          value: "details",

          child: Row(

            children: [

              Icon(
                Icons.person_outline,
              ),

              SizedBox(width: 10),

              Text(
                "Détails patient",
              ),
            ],
          ),
        ),
      ],
    );
  }
}