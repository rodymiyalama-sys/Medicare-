import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

import '../../../core/routes/app_routes.dart';

import '../controller/splash_controller.dart';

/// ======================================================
/// SPLASH SCREEN
///
/// Premier écran affiché au lancement
/// de l'application.
///
/// Affiche :
/// - Le logo
/// - Le nom MediCare
/// - Une animation
/// - Une barre de chargement
///
/// Puis redirige vers l'Onboarding.
/// ======================================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  /// Contrôleur d'animation
  late AnimationController _animationController;

  /// Animation de zoom
  late Animation<double> _scaleAnimation;

  /// Animation d'opacité
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    /// ====================================
    /// INITIALISATION DES ANIMATIONS
    /// ====================================
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1800,
      ),
    );

    /// Animation de zoom
    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    /// Animation de fondu
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    /// Démarrer l'animation
    _animationController.forward();

    /// Lancer le timer du splash
    SplashController.startSplash(() {

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.onboarding,
      );
    });
  }

  @override
  void dispose() {

    /// Libère la mémoire
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.primary,

      body: SafeArea(

        child: Center(

          child: AnimatedBuilder(

            animation: _animationController,

            builder: (context, child) {

              return FadeTransition(

                opacity: _fadeAnimation,

                child: ScaleTransition(

                  scale: _scaleAnimation,

                  child: child,
                ),
              );
            },

            child: Column(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                /// ===========================
                /// LOGO
                /// ===========================
                Container(

                  height: 140,
                  width: 140,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(30),
                  ),

                  child: Padding(
                    padding:
                    const EdgeInsets.all(20),

                    child: Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// ===========================
                /// NOM APPLICATION
                /// ===========================
                const Text(

                  AppStrings.appName,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight:
                    FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 10),

                /// ===========================
                /// SOUS TITRE
                /// ===========================
                const Text(

                  AppStrings.appSubtitle,

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 60),

                /// ===========================
                /// BARRE DE CHARGEMENT
                /// ===========================
                SizedBox(

                  width: 220,

                  child: ClipRRect(

                    borderRadius:
                    BorderRadius.circular(20),

                    child:
                    const LinearProgressIndicator(
                      minHeight: 8,
                      color: Colors.white,
                      backgroundColor:
                      Colors.white24,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// ===========================
                /// TEXTE DE CHARGEMENT
                /// ===========================
                const Text(

                  "Chargement...",

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}