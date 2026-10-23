import 'package:flutter/material.dart';

import '../widgets/dashboard_drawer.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/stats_cards.dart';
import '../widgets/charts_widget.dart';
import '../widgets/alerts_widget.dart';
import '../widgets/recent_appointment_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1100;

    return Scaffold(
      drawer: isDesktop ? null : const DashboardDrawer(),
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              const SizedBox(
                width: 250,
                child: DashboardDrawer(),
              ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DashboardHeader(),

                    const SizedBox(height: 20),

                    const StatsCards(),

                    const SizedBox(height: 20),

                    if (isDesktop)
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: RecentAppointmentWidget(),
                          ),

                          SizedBox(width: 20),

                          Expanded(
                            flex: 4,
                            child: ChartsWidget(),
                          ),

                          SizedBox(width: 20),

                          Expanded(
                            flex: 3,
                            child: AlertsWidget(),
                          ),
                        ],
                      ),

                    if (!isDesktop) ...[
                      const RecentAppointmentWidget(),

                      SizedBox(height: 20),

                      ChartsWidget(),

                      SizedBox(height: 20),

                      AlertsWidget(),
                    ],

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}