import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/routes/app_routes.dart';

import '../controller/onboarding_controller.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_page.dart';

/// =======================================================
/// ECRAN ONBOARDING
/// =======================================================
class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  /// Contrôleur PageView
  final PageController pageController =
  PageController();

  /// Index courant
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Column(

          children: [

            /// ============================
            /// PAGEVIEW
            /// ============================
            Expanded(

              child: PageView.builder(

                controller: pageController,

                itemCount:
                OnboardingController
                    .pages
                    .length,

                onPageChanged: (index) {

                  setState(() {

                    currentPage = index;
                  });
                },

                itemBuilder: (context, index) {

                  final page =
                  OnboardingController
                      .pages[index];

                  return OnboardingPage(

                    image: page.image,

                    title: page.title,

                    description:
                    page.description,
                  );
                },
              ),
            ),

            /// ============================
            /// INDICATEURS
            /// ============================
            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: List.generate(

                OnboardingController
                    .pages
                    .length,

                    (index) => OnboardingIndicator(

                  isActive:
                  currentPage == index,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// ============================
            /// BOUTON SUIVANT
            /// ============================
            Padding(

              padding:
              const EdgeInsets.symmetric(
                horizontal: 24,
              ),

              child: SizedBox(

                width: double.infinity,
                height: 55,

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

                    /// Dernière page
                    if (currentPage ==
                        OnboardingController
                            .pages
                            .length -
                            1) {

                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.login,
                      );

                    } else {

                      pageController.nextPage(

                        duration:
                        const Duration(
                          milliseconds: 300,
                        ),

                        curve:
                        Curves.easeInOut,
                      );
                    }
                  },

                  child: Text(

                    currentPage ==
                        OnboardingController
                            .pages
                            .length -
                            1
                        ? "Commencer"
                        : "Suivant",

                    style:
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}