class PatientModel {
  final String id;
  final String nom;
  final int age;
  final String sexe;
  final String telephone;
  final bool actif;

  const PatientModel({
    required this.id,
    required this.nom,
    required this.age,
    required this.sexe,
    required this.telephone,
    required this.actif,
  });
}