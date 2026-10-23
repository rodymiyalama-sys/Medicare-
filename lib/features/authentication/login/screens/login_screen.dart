import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

import '../controller/login_controller.dart';
import '../widgets/login_form.dart';

/// =======================================================
/// LOGIN SCREEN
///
/// Responsive:
/// - Mobile
/// - Tablette
/// - Desktop
///
/// Sur Desktop:
/// ┌────────────┬────────────┐
/// │ Illustration│ Formulaire│
/// └────────────┴────────────┘
///
/// Sur Mobile:
/// Illustration
/// Formulaire
/// =======================================================
class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  /// Contrôleur Login
  final LoginController controller =
  LoginController();

  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Center(
          child: _buildFormSection(),
        ),
      ),
    );
  }


  /// =====================================================
  /// SECTION FORMULAIRE
  /// =====================================================
  Widget _buildFormSection() {

    return Center(

      child: SingleChildScrollView(

        padding:
        const EdgeInsets.all(30),

        child: ConstrainedBox(

          constraints:
          const BoxConstraints(
            maxWidth: 380,
          ),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.center,

            children: [

              const Text(

                "Connexion",

                style: TextStyle(

                  fontSize: 30,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(

                "Connectez-vous à votre compte",

                style: TextStyle(

                  color:
                  Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 20),

              /// Formulaire
              LoginForm(
                controller:
                controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}