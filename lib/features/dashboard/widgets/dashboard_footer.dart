import 'package:flutter/material.dart';

class DashboardFooter extends StatelessWidget {

  const DashboardFooter({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(

      child: Padding(

        padding: EdgeInsets.all(20),

        child: Text(
          "MediCare HMS v1.0 © 2026",
        ),
      ),
    );
  }
}