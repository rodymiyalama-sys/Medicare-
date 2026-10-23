import 'package:flutter/material.dart';

/// =====================================
/// WIDGETS
/// =====================================
import '../widgets/patients_header.dart';
import '../widgets/patients_filters.dart';
import '../widgets/patients_table.dart';

/// =====================================
/// PAGE PATIENTS
///
/// Liste complète des patients
/// =====================================
class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// COULEUR DE FOND
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// =====================================
              /// HEADER
              /// =====================================
              const PatientsHeader(),

              const SizedBox(height: 25),

              /// =====================================
              /// FILTRES
              /// =====================================
              const PatientsFilters(),

              const SizedBox(height: 25),

              /// =====================================
              /// TABLEAU DES PATIENTS
              /// =====================================
              const PatientsTable(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}