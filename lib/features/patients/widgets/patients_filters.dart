import 'package:flutter/material.dart';

class PatientsFilters extends StatelessWidget {
  const PatientsFilters({super.key});

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

      child: Row(
        children: [

          /// RECHERCHE
          Expanded(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Rechercher un patient...",
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          /// FILTRE STATUT
          Expanded(
            child: DropdownButtonFormField<String>(
              initialValue: "Tous",

              decoration: InputDecoration(
                labelText: "Statut",

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(12),
                ),
              ),

              items: const [
                DropdownMenuItem(
                  value: "Tous",
                  child: Text("Tous"),
                ),
                DropdownMenuItem(
                  value: "Actif",
                  child: Text("Actif"),
                ),
                DropdownMenuItem(
                  value: "Inactif",
                  child: Text("Inactif"),
                ),
              ],

              onChanged: (value) {},
            ),
          ),

          const SizedBox(width: 20),

          /// BOUTON RESET
          ElevatedButton.icon(
            onPressed: () {},

            icon: const Icon(Icons.refresh),

            label: const Text(
              "Réinitialiser",
            ),

            style: ElevatedButton.styleFrom(
              minimumSize:
              const Size(160, 55),
            ),
          ),
        ],
      ),
    );
  }
}