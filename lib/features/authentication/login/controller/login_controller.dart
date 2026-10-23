import 'package:flutter/material.dart';

/// =======================================================
/// LOGIN CONTROLLER
///
/// Responsable de :
///
/// - Gestion des champs Email
/// - Gestion du mot de passe
/// - Affichage/Masquage du mot de passe
/// - Validation du formulaire
/// - Libération de la mémoire
///
/// =======================================================
class LoginController {

  /// =====================================================
  /// CONTROLLERS
  /// =====================================================

  /// Champ Email
  final TextEditingController emailController =
  TextEditingController();

  /// Champ Mot de passe
  final TextEditingController passwordController =
  TextEditingController();

  /// =====================================================
  /// FORM KEY
  /// =====================================================

  /// Permet de valider le formulaire
  final GlobalKey<FormState> formKey =
  GlobalKey<FormState>();

  /// =====================================================
  /// ETAT MOT DE PASSE
  /// =====================================================

  /// true = caché
  /// false = visible
  bool obscurePassword = true;

  /// =====================================================
  /// AFFICHER / MASQUER MOT DE PASSE
  /// =====================================================

  void togglePasswordVisibility(
      VoidCallback refreshUI) {

    obscurePassword = !obscurePassword;

    refreshUI();
  }

  /// =====================================================
  /// VALIDATION EMAIL
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
  /// VALIDATION MOT DE PASSE
  /// =====================================================

  String? validatePassword(String? value) {

    if (value == null || value.isEmpty) {

      return "Veuillez entrer votre mot de passe";
    }

    if (value.length < 6) {

      return "Minimum 6 caractères";
    }

    return null;
  }

  /// =====================================================
  /// VERIFICATION DU FORMULAIRE
  /// =====================================================

  bool validateForm() {

    return formKey.currentState?.validate() ??
        false;
  }

  /// =====================================================
  /// NETTOYAGE MEMOIRE
  /// =====================================================

  void dispose() {

    emailController.dispose();

    passwordController.dispose();
  }
}