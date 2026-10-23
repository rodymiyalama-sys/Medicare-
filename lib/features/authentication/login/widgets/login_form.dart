import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';

import '../controller/login_controller.dart';

/// =======================================================
/// LOGIN FORM
///
/// Formulaire principal de connexion
///
/// Contient :
///
/// - Email
/// - Mot de passe
/// - Mot de passe oublié
/// - Connexion
/// - Google
/// - Microsoft
///
/// Responsive Mobile / Tablette / Desktop
/// =======================================================
class LoginForm extends StatefulWidget {

  final LoginController controller;

  const LoginForm({
    super.key,
    required this.controller,
  });

  @override
  State<LoginForm> createState() =>
      _LoginFormState();
}

class _LoginFormState
    extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {

    /// Largeur écran
    final width =
        MediaQuery.of(context).size.width;

    /// Responsive
    final isDesktop = width > 1100;

    final isTablet =
        width > 600 && width <= 1100;

    return Form(

      key: widget.controller.formKey,

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          /// ==================================
          /// EMAIL
          /// ==================================
          const Text(
            "Adresse Email",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          TextFormField(

            controller:
            widget.controller.emailController,

            validator:
            widget.controller.validateEmail,

            keyboardType:
            TextInputType.emailAddress,

            decoration: InputDecoration(

              hintText:
              "exemple@gmail.com",

              prefixIcon:
              const Icon(Icons.email),

              border:
              OutlineInputBorder(

                borderRadius:
                BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// ==================================
          /// MOT DE PASSE
          /// ==================================
          const Text(
            "Mot de passe",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          TextFormField(

            controller:
            widget.controller.passwordController,

            validator:
            widget.controller.validatePassword,

            obscureText:
            widget.controller.obscurePassword,

            decoration: InputDecoration(

              hintText:
              "********",

              prefixIcon:
              const Icon(Icons.lock),

              suffixIcon: IconButton(

                onPressed: () {

                  widget.controller
                      .togglePasswordVisibility(
                        () {
                      setState(() {});
                    },
                  );
                },

                icon: Icon(

                  widget.controller
                      .obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),

              border:
              OutlineInputBorder(

                borderRadius:
                BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// ==================================
          /// MOT DE PASSE OUBLIE
          /// ==================================
          Align(

            alignment:
            Alignment.centerRight,

            child: TextButton(

              onPressed: () {

                Navigator.pushNamed(
                  context,
                  AppRoutes.forgotPassword,
                );
              },

              child: const Text(
                "Mot de passe oublié ?",
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// ==================================
          /// BOUTON CONNEXION
          /// ==================================
          SizedBox(

            width: double.infinity,

            height: isDesktop
                ? 60
                : isTablet
                ? 58
                : 55,

            child: ElevatedButton(

              style:
              ElevatedButton.styleFrom(

                backgroundColor:
                AppColors.primary,

                shape:
                RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(
                    12,
                  ),
                ),
              ),

              onPressed: () {

                if (widget.controller
                    .validateForm()) {

                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.dashboard,
                  );
                }
              },

              child: const Text(

                "Se connecter",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// ==================================
          /// SEPARATEUR
          /// ==================================
          Row(

            children: [

              const Expanded(
                child: Divider(),
              ),

              Padding(

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 12,
                ),

                child: Text(
                  "OU",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),

              const Expanded(
                child: Divider(),
              ),
            ],
          ),

          const SizedBox(height: 30),

          /// ==================================
          /// GOOGLE
          /// ==================================
          SizedBox(

            width: double.infinity,
            height: 40,

            child: OutlinedButton.icon(

              onPressed: () {

                /// Google Auth
              },

              icon: const Icon(
                Icons.g_mobiledata,
                size: 30,
              ),

              label: const Text(
                "Continuer avec Google",
              ),
            ),
          ),

          const SizedBox(height: 15),

          /// ==================================
          /// MICROSOFT
          /// ==================================
          SizedBox(

            width: double.infinity,
            height: 40,

            child: OutlinedButton.icon(

              onPressed: () {

                /// Microsoft Auth
              },

              icon: const Icon(
                Icons.window,
              ),

              label: const Text(
                "Continuer avec Microsoft",
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// ==================================
          /// INSCRIPTION
          /// ==================================
          Row(

            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              const Text(
                "Pas encore de compte ?",
              ),

              TextButton(

                onPressed: () {

                  Navigator.pushNamed(
                    context,
                    AppRoutes.register,
                  );
                },

                child: const Text(
                  "S'inscrire",
                ),
              ),
            ],
          ),
        ],
),
);
}
}