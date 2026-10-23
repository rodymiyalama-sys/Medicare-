import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/route_generator.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

/// =======================================================
/// POINT D'ENTRÉE DE L'APPLICATION
/// =======================================================
void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MediCareApp(),
  );
}

/// =======================================================
/// WIDGET RACINE
/// =======================================================
class MediCareApp extends StatelessWidget {

  const MediCareApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(
        390,
        844,
      ),

      minTextAdapt: true,

      builder: (context, child) {

        return MaterialApp(

          debugShowCheckedModeBanner: false,

          title: "MediCare",

          theme: AppTheme.light,

          darkTheme: AppTheme.dark,

          initialRoute:
          AppRoutes.splash,

          onGenerateRoute:
          RouteGenerator.generateRoute,
        );
      },
    );
  }
}