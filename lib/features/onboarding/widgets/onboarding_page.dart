import 'package:flutter/material.dart';

/// =======================================================
/// WIDGET D'UNE PAGE ONBOARDING
/// =======================================================
class OnboardingPage extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          /// Illustration
          Image.asset(
            image,
            height: 280,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 40),

          /// Titre
          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          /// Description
          Text(
            description,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}