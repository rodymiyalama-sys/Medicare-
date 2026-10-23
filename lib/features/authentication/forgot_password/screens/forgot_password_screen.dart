import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

import '../controller/forgot_password_controller.dart';

/// =======================================================
/// FORGOT PASSWORD SCREEN
///
/// Responsive Mobile
/// Responsive Tablette
/// Responsive Desktop
/// =======================================================
class ForgotPasswordScreen
    extends StatefulWidget {

  const ForgotPasswordScreen({
    super.key,
  });

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final ForgotPasswordController controller =
  ForgotPasswordController();

  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final width =
        MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor:
      AppColors.background,

      appBar: AppBar(

        title: const Text(
          "Mot de passe oublié",
        ),

        centerTitle: true,
      ),

      body: Center(

        child: SingleChildScrollView(

          padding:
          const EdgeInsets.all(24),

          child: SizedBox(

            width: width > 700
                ? 500
                : double.infinity,

            child: Form(

              key: controller.formKey,

              child: Column(

                children: [

                  /// =========================
                  /// ICONE
                  /// =========================
                  Container(

                    height: 120,
                    width: 120,

                    decoration: BoxDecoration(

                      color: AppColors.primary
                        .withValues(alpha: 0.1),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(

                      Icons.lock_reset,

                      size: 60,

                      color:
                      AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// =========================
                  /// TITRE
                  /// =========================
                  const Text(

                    "Réinitialiser le mot de passe",

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(

                    "Entrez votre adresse email afin de recevoir un lien de réinitialisation.",

                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  /// =========================
                  /// EMAIL
                  /// =========================
                  TextFormField(

                    controller:
                    controller
                        .emailController,

                    validator:
                    controller
                        .validateEmail,

                    decoration:
                    const InputDecoration(

                      labelText:
                      "Adresse Email",

                      prefixIcon:
                      Icon(Icons.email),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// =========================
                  /// BOUTON ENVOYER
                  /// =========================
                  SizedBox(

                    width: double.infinity,

                    height: 55,

                    child: ElevatedButton(

                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        AppColors.primary,
                      ),

                      onPressed: () {

                        if (controller
                            .validateForm()) {

                          ScaffoldMessenger.of(
                              context)
                              .showSnackBar(

                            const SnackBar(

                              content: Text(
                                "Lien envoyé à votre adresse email",
                              ),
                            ),
                          );
                        }
                      },

                      child: const Text(

                        "Envoyer",

                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// =========================
                  /// RETOUR LOGIN
                  /// =========================
                  TextButton(

                    onPressed: () {

                      Navigator.pop(
                        context,
                      );
                    },

                    child: const Text(
                      "Retour à la connexion",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}