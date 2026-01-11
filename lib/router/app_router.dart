import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/services_page.dart';
import '../pages/contact_page.dart';

/// Application router configuration using go_router.
/// Provides named routes that work with browser URL and history.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomePage()),
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AboutPage()),
      ),
      GoRoute(
        path: '/services',
        name: 'services',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ServicesPage()),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ContactPage()),
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Page not found',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text('The page "${state.uri.path}" does not exist.'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
