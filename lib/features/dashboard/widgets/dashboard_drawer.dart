import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),

      child: SafeArea(
        child: Column(
          children: [

            /// =====================================
            /// LOGO + NOM HOPITAL
            /// =====================================
            Container(
              padding: const EdgeInsets.all(20),

              child: const Row(
                children: [

                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFF2563EB),

                    child: Icon(
                      Icons.local_hospital,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      "MediCare HMS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(
              color: Colors.white24,
            ),

            /// =====================================
            /// MENU PRINCIPAL
            /// =====================================
            Flexible(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [

                  _menuItem(
                    context,
                    Icons.dashboard_outlined,
                    "Dashboard",
                    AppRoutes.dashboard,
                  ),

                  _menuItem(
                    context,
                    Icons.people_outline,
                    "Patients",
                    AppRoutes.patients,
                  ),

                  _menuItem(
                    context,
                    Icons.medical_services_outlined,
                    "Médecins",
                    AppRoutes.doctors,
                  ),

                  _menuItem(
                    context,
                    Icons.calendar_month_outlined,
                    "Rendez-vous",
                    AppRoutes.appointments,
                  ),

                  _menuItem(
                    context,
                    Icons.local_hospital_outlined,
                    "Admissions",
                    AppRoutes.admissions,
                  ),

                  _menuItem(
                    context,
                    Icons.bed_outlined,
                    "Chambres & Lits",
                    AppRoutes.rooms,
                  ),

                  _menuItem(
                    context,
                    Icons.science_outlined,
                    "Laboratoire",
                    AppRoutes.laboratory,
                  ),

                  _menuItem(
                    context,
                    Icons.inventory_2_outlined,
                    "Stock",
                    AppRoutes.stocks,
                  ),

                  _menuItem(
                    context,
                    Icons.local_pharmacy_outlined,
                    "Pharmacie",
                    AppRoutes.pharmacy,
                  ),

                  _menuItem(
                    context,
                    Icons.receipt_long_outlined,
                    "Facturation",
                    AppRoutes.billing,
                  ),

                  _menuItem(
                    context,
                    Icons.bar_chart_outlined,
                    "Rapports",
                    AppRoutes.reports,
                  ),

                  _menuItem(
                    context,
                    Icons.settings_outlined,
                    "Paramètres",
                    AppRoutes.settings,
                  ),
                ],
              ),
            ),


      /// =====================================
            /// UTILISATEUR CONNECTE
            /// =====================================

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

              child: const Row(
                children: [

                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Administrateur",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "En ligne",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ),
         ],
        ),
      ),
    );
  }

  /// =====================================
  /// ITEM MENU
  /// =====================================
  Widget _menuItem(
      BuildContext context,
      IconData icon,
      String title,
      String route,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white70,
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {

        Navigator.pushNamed(
          context,
          route,
        );
      },
    );
  }
}