import '../../../core/constants/app_assets.dart';

/// =======================================================
/// MODELE D'UNE PAGE ONBOARDING
/// =======================================================
class OnboardingModel {

  final String image;
  final String title;
  final String description;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

/// =======================================================
/// DONNEES DES PAGES
/// =======================================================
class OnboardingController {

  static List<OnboardingModel> pages = [

    OnboardingModel(
      image: AppAssets.onboarding1,
      title: "Bienvenue dans MediCare",
      description:
      "La solution complète pour gérer votre établissement de santé.",
    ),

    OnboardingModel(
      image: AppAssets.onboarding2,
      title: "Gestion centralisée",
      description:
      "Gérez tous les services de votre hôpital depuis une seule plateforme.",
    ),

    OnboardingModel(
      image: AppAssets.onboarding3,
      title: "Soins optimisés",
      description:
      "Améliorez la prise en charge des patients et la coordination des équipes.",
    ),

    OnboardingModel(
      image: AppAssets.onboarding4,
      title: "Sécurité & Fiabilité",
      description:
      "Vos données sont protégées selon les standards médicaux.",
    ),

    OnboardingModel(
      image: AppAssets.onboarding5,
      title: "Accessible partout",
      description:
      "Accédez à l'application à tout moment depuis n'importe quel appareil.",
    ),
  ];
}