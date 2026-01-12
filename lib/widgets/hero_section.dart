import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Professional hero section with animated elements.
class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 768;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.85,
      constraints: const BoxConstraints(minHeight: 500, maxHeight: 800),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        image: const DecorationImage(
          image: AssetImage('assets/images/hero.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.4),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '✦ TRUSTED SINCE 2010',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Main Title
                      Text(
                        'JERMAN COMPANY',
                        style:
                            (isSmallScreen
                                    ? Theme.of(context).textTheme.displaySmall
                                    : Theme.of(context).textTheme.displayLarge)
                                ?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: 3,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      // Tagline
                      Container(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Text(
                          'Delivering excellence and professional services you can trust. Your success is our commitment.',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w300,
                                height: 1.5,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 48),
                      // CTA Buttons
                      Wrap(
                        spacing: 20,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          _AnimatedButton(
                            onPressed: () => context.go('/contact'),
                            isPrimary: true,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Get Started'),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _AnimatedButton(
                            onPressed: () => context.go('/services'),
                            isPrimary: false,
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_circle_outline, size: 22),
                                SizedBox(width: 8),
                                Text('Our Services'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      // Trust indicators
                      Wrap(
                        spacing: 40,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          _TrustIndicator(
                            icon: Icons.verified,
                            text: 'Certified',
                          ),
                          _TrustIndicator(
                            icon: Icons.support_agent,
                            text: '24/7 Support',
                          ),
                          _TrustIndicator(
                            icon: Icons.star,
                            text: '500+ Clients',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isPrimary;
  final Widget child;

  const _AnimatedButton({
    required this.onPressed,
    required this.isPrimary,
    required this.child,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: widget.isPrimary
            ? ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  elevation: _isHovered ? 8 : 0,
                  shadowColor: Colors.black26,
                ),
                child: widget.child,
              )
            : OutlinedButton(
                onPressed: widget.onPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                ),
                child: widget.child,
              ),
      ),
    );
  }
}

class _TrustIndicator extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TrustIndicator({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
