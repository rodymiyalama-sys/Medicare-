import 'package:flutter/material.dart';

import '../models/patient_model.dart';
import 'patient_row.dart';

class PatientsTable extends StatelessWidget {
  const PatientsTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Liste des patients (données fictives ici)
    final patients = [
      const PatientModel(
        id: "PAT-2024-00125",
        nom: "Jean Dupont",
        age: 65,
        sexe: "Homme",
        telephone: "+242 06 123 45 67",
        actif: true,
      ),
      const PatientModel(
        id: "PAT-2024-00124",
        nom: "Marie Martin",
        age: 42,
        sexe: "Femme",
        telephone: "+242 06 987 65 43",
        actif: true,
      ),
      const PatientModel(
        id: "PAT-2024-00123",
        nom: "Paul Ndzi",
        age: 58,
        sexe: "Homme",
        telephone: "+242 05 111 22 33",
        actif: false,
      ),
    ];

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

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 60,
          columns: const [
            DataColumn(label: Text("Photo")),
            DataColumn(label: Text("ID Patient")),
            DataColumn(label: Text("Nom complet")),
            DataColumn(label: Text("Âge")),
            DataColumn(label: Text("Sexe")),
            DataColumn(label: Text("Téléphone")),
            DataColumn(label: Text("Statut")),
            DataColumn(label: Text("Actions")),
          ],
          rows: patients.map((patient) => PatientRow.build(context, patient)).toList(),
        ),
      ),
    );
  }
}