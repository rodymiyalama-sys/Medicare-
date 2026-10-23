import 'package:flutter/material.dart';

/// =====================================================
/// RENDEZ-VOUS DU PATIENT
/// =====================================================
class PatientAppointmentsWidget extends StatelessWidget {
  const PatientAppointmentsWidget({super.key});

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

          /// TITRE
          const Text(
            "Rendez-vous récents",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _appointment(
            "Consultation",
            "12 Juin 2026",
            "Dr Martin",
          ),

          const Divider(),

          _appointment(
            "Cardiologie",
            "28 Mai 2026",
            "Dr Bernard",
          ),

          const Divider(),

          _appointment(
            "Contrôle",
            "15 Avril 2026",
            "Dr Paul",
          ),
        ],
      ),
    );
  }

  Widget _appointment(
      String title,
      String date,
      String doctor,
      ) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.calendar_month),
      ),

      title: Text(title),

      subtitle: Text(
        "$date • $doctor",
      ),
    );
  }
}