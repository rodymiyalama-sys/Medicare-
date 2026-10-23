import 'package:flutter/material.dart';

import '../widgets/patient_profile_card.dart';
import '../widgets/patient_medical_info_card.dart';
import '../widgets/patient_resume_widget.dart';
import '../widgets/patient_appointments_widget.dart';
import '../widgets/patient_stats_widget.dart';

/// =====================================================
/// PAGE DETAILS PATIENT
/// =====================================================
class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// =====================================
              /// BOUTON RETOUR
              /// =====================================
              ElevatedButton.icon(

                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(
                  Icons.arrow_back,
                ),

                label: const Text(
                  "Retour",
                ),
              ),

              const SizedBox(height: 25),

              /// =====================================
              /// TITRE
              /// =====================================
              const Text(
                "Détails du patient",

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              /// =====================================
              /// HAUT DE PAGE
              /// =====================================
              Row(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// PROFIL
                  const Expanded(
                    flex: 2,
                    child: PatientProfileCard(),
                  ),

                  const SizedBox(width: 20),

                  /// INFOS MEDICALES
                  const Expanded(
                    flex: 3,
                    child: PatientMedicalInfoCard(),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// =====================================
              /// BAS DE PAGE
              /// =====================================
              Row(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// RESUME
                  const Expanded(
                    child: PatientResumeWidget(),
                  ),

                  const SizedBox(width: 20),

                  /// RDV
                  const Expanded(
                    child:
                    PatientAppointmentsWidget(),
                  ),

                  const SizedBox(width: 20),

                  /// STATS
                  const Expanded(
                    child: PatientStatsWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}