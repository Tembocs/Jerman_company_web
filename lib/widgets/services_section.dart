import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Ultra-professional services section with advanced animations and effects.
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    final isMediumScreen = MediaQuery.of(context).size.width < 1024;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF9FAFB), Color(0xFFF3F4F6)],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 64 : 100,
              horizontal: 24,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    // Section Header with animated line
                    _AnimatedSectionHeader(),
                    const SizedBox(height: 60),
                    // Services Grid
                    LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = isSmallScreen
                            ? 1
                            : (isMediumScreen ? 2 : 3);
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 32,
                          crossAxisSpacing: 32,
                          childAspectRatio: isSmallScreen ? 1.6 : 0.95,
                          children: const [
                            _UltraServiceCard(
                              icon: Icons.architecture,
                              title: 'Strategic Consulting',
                              description:
                                  'Expert advice and strategic guidance to help you make informed business decisions and achieve sustainable growth.',
                              color: Color(0xFF059669),
                              features: [
                                'Business Analysis',
                                'Strategy Planning',
                                'Market Research',
                              ],
                              index: 0,
                            ),
                            _UltraServiceCard(
                              icon: Icons.trending_up,
                              title: 'Business Growth',
                              description:
                                  'Proven strategies to accelerate your business growth, maximize revenue, and expand your market presence.',
                              color: Color(0xFF0891B2),
                              features: [
                                'Revenue Optimization',
                                'Market Expansion',
                                'Brand Development',
                              ],
                              index: 1,
                            ),
                            _UltraServiceCard(
                              icon: Icons.shield_outlined,
                              title: 'Risk Management',
                              description:
                                  'Comprehensive risk assessment and mitigation strategies to protect your enterprise from uncertainties.',
                              color: Color(0xFF7C3AED),
                              features: [
                                'Risk Assessment',
                                'Compliance',
                                'Insurance Advisory',
                              ],
                              index: 2,
                            ),
                            _UltraServiceCard(
                              icon: Icons.headset_mic,
                              title: '24/7 Support',
                              description:
                                  'Round-the-clock dedicated support team ensuring your complete satisfaction at every step of the journey.',
                              color: Color(0xFFDB2777),
                              features: [
                                'Live Chat',
                                'Phone Support',
                                'Priority Response',
                              ],
                              index: 3,
                            ),
                            _UltraServiceCard(
                              icon: Icons.insights,
                              title: 'Data Analytics',
                              description:
                                  'Transform your raw data into actionable insights that drive smarter decisions and better outcomes.',
                              color: Color(0xFFEA580C),
                              features: [
                                'Predictive Analytics',
                                'BI Dashboards',
                                'Custom Reports',
                              ],
                              index: 4,
                            ),
                            _UltraServiceCard(
                              icon: Icons.hub,
                              title: 'System Integration',
                              description:
                                  'Seamless integration solutions connecting all your business systems for maximum efficiency.',
                              color: Color(0xFF0D9488),
                              features: [
                                'API Development',
                                'Cloud Migration',
                                'Process Automation',
                              ],
                              index: 5,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 60),
                    // CTA Section
                    _ServicesCTA(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSectionHeader extends StatefulWidget {
  @override
  State<_AnimatedSectionHeader> createState() => _AnimatedSectionHeaderState();
}

class _AnimatedSectionHeaderState extends State<_AnimatedSectionHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _lineAnimation = Tween<double>(
      begin: 0,
      end: 1,
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
    return Column(
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                const Color(0xFF7C3AED).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.auto_awesome,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'WHAT WE DO',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Title with gradient
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF1F2937), Color(0xFF374151)],
          ).createShader(bounds),
          child: Text(
            'Services That Drive Results',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        // Animated line
        AnimatedBuilder(
          animation: _lineAnimation,
          builder: (context, child) {
            return Container(
              width: 80 * _lineAnimation.value,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    const Color(0xFF7C3AED),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        // Description
        Container(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            'We deliver comprehensive, tailored solutions designed to help your business thrive and succeed in today\'s dynamic and competitive market landscape.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF6B7280),
              height: 1.8,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _UltraServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final List<String> features;
  final int index;

  const _UltraServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.features,
    required this.index,
  });

  @override
  State<_UltraServiceCard> createState() => _UltraServiceCardState();
}

class _UltraServiceCardState extends State<_UltraServiceCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                color: _isHovered ? widget.color : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _isHovered ? widget.color : const Color(0xFFE5E7EB),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? widget.color.withOpacity(0.35)
                        : Colors.black.withOpacity(0.06),
                    blurRadius: _isHovered ? 40 : 20,
                    offset: Offset(0, _isHovered ? 20 : 10),
                    spreadRadius: _isHovered ? -5 : 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    // Decorative gradient overlay on hover
                    if (_isHovered)
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    // Number indicator
                    Positioned(
                      top: 20,
                      right: 20,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? Colors.white.withOpacity(0.2)
                              : widget.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '0${widget.index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _isHovered ? Colors.white : widget.color,
                          ),
                        ),
                      ),
                    ),
                    // Main content
                    Padding(
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon with animated container
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _isHovered
                                  ? Colors.white.withOpacity(0.2)
                                  : widget.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _isHovered
                                    ? Colors.white.withOpacity(0.3)
                                    : widget.color.withOpacity(0.2),
                              ),
                            ),
                            child: Icon(
                              widget.icon,
                              size: 28,
                              color: _isHovered ? Colors.white : widget.color,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Title
                          Text(
                            widget.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: _isHovered
                                      ? Colors.white
                                      : const Color(0xFF1F2937),
                                ),
                          ),
                          const SizedBox(height: 10),
                          // Description
                          Text(
                            widget.description,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: _isHovered
                                      ? Colors.white.withOpacity(0.9)
                                      : const Color(0xFF6B7280),
                                  height: 1.6,
                                ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          // Features chips
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: widget.features
                                .map(
                                  (f) => _FeatureChip(
                                    label: f,
                                    isHovered: _isHovered,
                                    color: widget.color,
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          // Learn more link
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            child: Row(
                              children: [
                                Text(
                                  'Learn More',
                                  style: TextStyle(
                                    color: _isHovered
                                        ? Colors.white
                                        : widget.color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  transform: Matrix4.identity()
                                    ..translate(_isHovered ? 4.0 : 0.0, 0.0),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18,
                                    color: _isHovered
                                        ? Colors.white
                                        : widget.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String label;
  final bool isHovered;
  final Color color;

  const _FeatureChip({
    required this.label,
    required this.isHovered,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isHovered
            ? Colors.white.withOpacity(0.15)
            : color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: isHovered ? Colors.white.withOpacity(0.9) : color,
        ),
      ),
    );
  }
}

class _ServicesCTA extends StatefulWidget {
  @override
  State<_ServicesCTA> createState() => _ServicesCTAState();
}

class _ServicesCTAState extends State<_ServicesCTA> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 32 : 48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            const Color(0xFF047857),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: isSmallScreen
          ? Column(
              children: [
                _buildContent(context),
                const SizedBox(height: 24),
                _buildButton(context),
              ],
            )
          : Row(
              children: [
                Expanded(child: _buildContent(context)),
                const SizedBox(width: 40),
                _buildButton(context),
              ],
            ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width < 768
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Ready to Transform Your Business?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          textAlign: MediaQuery.of(context).size.width < 768
              ? TextAlign.center
              : TextAlign.left,
        ),
        const SizedBox(height: 12),
        Text(
          'Get in touch with our experts and discover how we can help you achieve your goals.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
          ),
          textAlign: MediaQuery.of(context).size.width < 768
              ? TextAlign.center
              : TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go('/services'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.2 : 0.1),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -2))
              : Matrix4.identity(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'View All Services',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
