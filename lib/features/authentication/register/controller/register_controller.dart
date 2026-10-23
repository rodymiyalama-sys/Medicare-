import 'package:flutter/material.dart';

/// =======================================================
/// REGISTER CONTROLLER
///
/// Gestion du formulaire d'inscription
/// =======================================================
class RegisterController {

  /// Form Key
  final GlobalKey<FormState> formKey =
  GlobalKey<FormState>();

  /// Controllers
  final TextEditingController fullnameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  /// Etat mot de passe
  bool obscurePassword = true;

  /// Etat confirmation mot de passe
  bool obscureConfirmPassword = true;

  /// ============================================
  /// Afficher / Masquer mot de passe
  /// ============================================
  void togglePassword(
      VoidCallback refreshUI) {

    obscurePassword = !obscurePassword;

    refreshUI();
  }

  /// ============================================
  /// Afficher / Masquer confirmation
  /// ============================================
  void toggleConfirmPassword(
      VoidCallback refreshUI) {

    obscureConfirmPassword =
    !obscureConfirmPassword;

    refreshUI();
  }

  /// ============================================
  /// Validation nom
  /// ============================================
  String? validateName(String? value) {

    if (value == null || value.isEmpty) {

      return "Veuillez entrer votre nom";
    }

    return null;
  }

  /// ============================================
  /// Validation email
  /// ============================================
  String? validateEmail(String? value) {

    if (value == null || value.isEmpty) {

      return "Veuillez entrer votre email";
    }

    return null;
  }

  /// ============================================
  /// Validation mot de passe
  /// ============================================
  String? validatePassword(String? value) {

    if (value == null || value.length < 6) {

      return "Minimum 6 caractères";
    }

    return null;
  }

  /// ============================================
  /// Validation confirmation
  /// ============================================
  String? validateConfirmPassword(
      String? value) {

    if (value != passwordController.text) {

      return "Les mots de passe ne correspondent pas";
    }

    return null;
  }

  /// ============================================
  /// Validation Formulaire
  /// ============================================
  bool validateForm() {

    return formKey.currentState?.validate() ??
        false;
  }

  /// ============================================
  /// Dispose
  /// ============================================
  void dispose() {

    fullnameController.dispose();

    emailController.dispose();

    passwordController.dispose();

    confirmPasswordController.dispose();
  }
}