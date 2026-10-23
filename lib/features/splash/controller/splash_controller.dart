import 'dart:async';

/// ======================================================
/// SPLASH CONTROLLER
///
/// Responsable de :
/// - Gérer la durée du Splash Screen
/// - Déclencher la navigation après chargement
/// ======================================================
class SplashController {

  /// Durée d'affichage du Splash
  static const Duration splashDuration =
  Duration(seconds: 3);

  /// Exécute l'attente avant navigation
  static Future<void> startSplash(
      VoidCallback onFinished) async {

    Timer(
      splashDuration,
      onFinished,
    );
  }
}

/// Callback personnalisé
typedef VoidCallback = void Function();