import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';

import '../controller/register_controller.dart';

/// =======================================================
/// REGISTER SCREEN
///
/// Responsive:
/// - Mobile
/// - Tablette
/// - Desktop
/// =======================================================
class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final RegisterController controller =
  RegisterController();

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
        title: const Text("Créer un compte"),
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
                  /// NOM COMPLET
                  /// =========================
                  TextFormField(

                    controller:
                    controller
                        .fullnameController,

                    validator:
                    controller
                        .validateName,

                    decoration:
                    const InputDecoration(

                      labelText:
                      "Nom complet",

                      prefixIcon:
                      Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 20),

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
                      "Email",

                      prefixIcon:
                      Icon(Icons.email),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// =========================
                  /// PASSWORD
                  /// =========================
                  TextFormField(

                    controller:
                    controller
                        .passwordController,

                    validator:
                    controller
                        .validatePassword,

                    obscureText:
                    controller
                        .obscurePassword,

                    decoration:
                    InputDecoration(

                      labelText:
                      "Mot de passe",

                      prefixIcon:
                      const Icon(Icons.lock),

                      suffixIcon:
                      IconButton(

                        onPressed: () {

                          controller
                              .togglePassword(
                                () {
                              setState(() {});
                            },
                          );
                        },

                        icon: Icon(

                          controller
                              .obscurePassword
                              ? Icons.visibility
                              : Icons
                              .visibility_off,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// =========================
                  /// CONFIRM PASSWORD
                  /// =========================
                  TextFormField(

                    controller:
                    controller
                        .confirmPasswordController,

                    validator:
                    controller
                        .validateConfirmPassword,

                    obscureText:
                    controller
                        .obscureConfirmPassword,

                    decoration:
                    InputDecoration(

                      labelText:
                      "Confirmer le mot de passe",

                      prefixIcon:
                      const Icon(Icons.lock),

                      suffixIcon:
                      IconButton(

                        onPressed: () {

                          controller
                              .toggleConfirmPassword(
                                () {
                              setState(() {});
                            },
                          );
                        },

                        icon: Icon(

                          controller
                              .obscureConfirmPassword
                              ? Icons.visibility
                              : Icons
                              .visibility_off,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// =========================
                  /// INSCRIPTION
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

                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.dashboard,
                          );
                        }
                      },

                      child: const Text(
                        "Créer un compte",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Retour Login
                  TextButton(

                    onPressed: () {

                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Déjà un compte ? Se connecter",
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