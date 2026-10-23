import 'package:flutter/material.dart';

import '../../features/splash/screens/splash_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/authentication/login/screens/login_screen.dart';
import '../../features/authentication/register/screens/register_screen.dart';
import '../../features/authentication/forgot_password/screens/forgot_password_screen.dart';

import '../../features/dashboard/screens/dashboard_screen.dart';

import '../../features/patients/screens/patients_screen.dart';

import '../../features/doctors/screens/doctors_screen.dart';

import '../../features/appointments/screens/appointments_screen.dart';

import '../../features/admissions/screens/admission_screen.dart';

import '../../features/rooms/screens/room_screen.dart';

import '../../features/pharmacy/screens/pharmacy_screen.dart';

import '../../features/laboratory/screens/laboratory_screen.dart';

import '../../features/billing/screens/billing_screen.dart';

import '../../features/stocks/screens/stocks_screen.dart';

import '../../features/reports/screens/reports_screen.dart';

import '../../features/settings/screens/settings_screen.dart';

import '../../features/profile/screens/profile_screen.dart';

import '../../features/messaging/screens/messaging_screen.dart';

import '../../features/patients/screens/add_patients_screen.dart';

import '../../features/patients/screens/patients_details_screen.dart';

import 'app_routes.dart';

/// =======================================================
/// GESTION DE LA NAVIGATION
/// =======================================================
class RouteGenerator {

  static Route<dynamic> generateRoute(
      RouteSettings settings) {

    switch (settings.name) {

      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );

      case AppRoutes.patients:
        return MaterialPageRoute(
          builder: (_) => const PatientsScreen(),
        );

      case '/add-patient':
        return MaterialPageRoute(
          builder: (_) => const AddPatientsScreen(),
        );

      case '/patient-details':
        return MaterialPageRoute(
          builder: (_) => const PatientDetailsScreen(),
        );

      case AppRoutes.doctors:
        return MaterialPageRoute(
          builder: (_) => const DoctorsScreen(),
        );

      case AppRoutes.appointments:
        return MaterialPageRoute(
          builder: (_) => const AppointmentsScreen(),
        );

      case AppRoutes.admissions:
        return MaterialPageRoute(
          builder: (_) => const AdmissionsScreen(),
        );

      case AppRoutes.rooms:
        return MaterialPageRoute(
          builder: (_) => const RoomsScreen(),
        );

      case AppRoutes.pharmacy:
        return MaterialPageRoute(
          builder: (_) => const PharmacyScreen(),
        );

      case AppRoutes.laboratory:
        return MaterialPageRoute(
          builder: (_) => const LaboratoryScreen(),
        );

      case AppRoutes.billing:
        return MaterialPageRoute(
          builder: (_) => const BillingScreen(),
        );

      case AppRoutes.stocks:
        return MaterialPageRoute(
          builder: (_) => const StocksScreen(),
        );

      case AppRoutes.reports:
        return MaterialPageRoute(
          builder: (_) => const ReportsScreen(),
        );

      case AppRoutes.messaging:
        return MaterialPageRoute(
          builder: (_) => const MessagingScreen(),
        );

      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );

      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page introuvable"),
            ),
          ),
        );
    }
  }
}