import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Hero section with background image, title, tagline, and CTA buttons.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.7,
      constraints: const BoxConstraints(minHeight: 400, maxHeight: 600),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        image: const DecorationImage(
          image: AssetImage('assets/images/hero.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          onError: null,
        ),
      ),
      child: Container(
        // Fallback gradient overlay
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'JERMAN COMPANY',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Professional services you can trust.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go('/contact'),
                        icon: const Icon(Icons.request_quote),
                        label: const Text('Get a Quote'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 20 : 32,
                            vertical: isSmallScreen ? 14 : 18,
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Placeholder action for Call Us
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Call us at +255 000 000 000'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.phone),
                        label: const Text('Call Us'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 2),
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 20 : 32,
                            vertical: isSmallScreen ? 14 : 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
