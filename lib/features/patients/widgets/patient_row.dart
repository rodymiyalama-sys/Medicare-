import 'package:flutter/material.dart';

import '../models/patient_model.dart';

import 'patient_action_menu.dart';

class PatientRow {

  static DataRow build(
      BuildContext context,
      PatientModel patient,
      ) {

    return DataRow(

      cells: [

        /// PHOTO
        DataCell(

          CircleAvatar(
            radius: 22,
            backgroundColor:
            const Color(0xFFE0E7FF),

            child: Text(

              patient.nom[0],

              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2563EB),
              ),
            ),
          ),
        ),

        /// ID
        DataCell(

          Text(

            patient.id,

            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        /// NOM
        DataCell(
          Text(patient.nom),
        ),

        /// AGE
        DataCell(
          Text("${patient.age} ans"),
        ),

        /// SEXE
        DataCell(

          Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),

            decoration: BoxDecoration(

              color: patient.sexe == "Homme"
                  ? Colors.blue.shade50
                  : Colors.pink.shade50,

              borderRadius:
              BorderRadius.circular(30),
            ),

            child: Text(
              patient.sexe,
            ),
          ),
        ),

        /// TELEPHONE
        DataCell(
          Text(patient.telephone),
        ),

        /// STATUT
        DataCell(

          Container(

            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),

            decoration: BoxDecoration(

              color: patient.actif
                  ? Colors.green.shade50
                  : Colors.red.shade50,

              borderRadius:
              BorderRadius.circular(30),
            ),

            child: Text(

              patient.actif
                  ? "Actif"
                  : "Inactif",

              style: TextStyle(

                color: patient.actif
                    ? Colors.green
                    : Colors.red,

                fontWeight:
                FontWeight.w600,
              ),
            ),
          ),
        ),

        /// ACTIONS
        DataCell(

          Row(

            mainAxisSize: MainAxisSize.min,

            children: [

              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.visibility_outlined,
                ),
              ),

              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.edit_outlined,
                ),
              ),
              PatientActionMenu(),
            ],
          ),
        ),
      ],
    );
  }
}