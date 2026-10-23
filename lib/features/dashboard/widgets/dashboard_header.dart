import 'package:flutter/material.dart';

/// =====================================================
/// DASHBOARD HEADER
///
/// Partie supérieure du Dashboard
///
/// Contient :
/// - Salutation
/// - Date
/// - Recherche
/// - Notifications
/// - Profil
/// =====================================================
class DashboardHeader extends StatelessWidget {

  const DashboardHeader({super.key});

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

          /// ==========================
          /// TITRE
          /// ==========================
          const Expanded(

            flex: 3,

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  "Bonjour, Dr. Martin Claire 👋",

                  style: TextStyle(

                    fontSize: 24,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(

                  "Bienvenue sur MediCare HMS",

                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// ==========================
          /// RECHERCHE
          /// ==========================
          Expanded(

            flex: 2,

            child: SizedBox(

              height: 50,

              child: TextField(

                decoration: InputDecoration(

                  hintText:
                  "Rechercher...",

                  prefixIcon:
                  const Icon(Icons.search),

                  filled: true,

                  fillColor:
                  const Color(0xfff5f7fb),

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                      12,
                    ),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          /// ==========================
          /// NOTIFICATION
          /// ==========================
          IconButton(

            onPressed: () {},

            icon: const Icon(
              Icons.notifications_none,
              size: 28,
            ),
          ),

          const SizedBox(width: 10),

          /// ==========================
          /// PROFIL
          /// ==========================
          GestureDetector(

            onTap: () {

              /// Ouvrir le profil administrateur
              Navigator.pushNamed(
                context,
                '/profile',
              );
            },

            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xff0F3D91),

              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}