import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';

/// Main application widget with Material 3 theme and go_router.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'JERMAN COMPANY',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
