import 'package:flutter/material.dart';

/// =======================================================
/// FORGOT PASSWORD CONTROLLER
///
/// Gestion du formulaire
/// de récupération du mot de passe
/// =======================================================
class ForgotPasswordController {

  /// Formulaire
  final GlobalKey<FormState> formKey =
  GlobalKey<FormState>();

  /// Champ Email
  final TextEditingController emailController =
  TextEditingController();

  /// =====================================================
  /// Validation Email
  /// =====================================================
  String? validateEmail(String? value) {

    if (value == null || value.isEmpty) {

      return "Veuillez entrer votre email";
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value)) {

      return "Adresse email invalide";
    }

    return null;
  }

  /// =====================================================
  /// Validation formulaire
  /// =====================================================
  bool validateForm() {

    return formKey.currentState?.validate() ??
        false;
  }

  /// =====================================================
  /// Nettoyage mémoire
  /// =====================================================
  void dispose() {

    emailController.dispose();
  }
}