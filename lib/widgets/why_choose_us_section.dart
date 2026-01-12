import 'package:flutter/material.dart';

/// Ultra-professional "Why Choose Us" section with advanced animations.
class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFFAFAFA), Colors.white],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background patterns
          Positioned(
            top: 100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7C3AED).withOpacity(0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 64 : 120,
              horizontal: 24,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isSmallScreen
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AnimatedBadge(),
              const SizedBox(height: 24),
              _GradientTitle(),
              const SizedBox(height: 24),
              Text(
                'With over 15 years of industry experience, we\'ve empowered hundreds of businesses to achieve remarkable growth through innovative solutions, strategic guidance, and unwavering dedication to excellence.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF6B7280),
                  height: 1.8,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 40),
              _buildEnhancedFeatureList(context),
              const SizedBox(height: 40),
              _TrustIndicators(),
            ],
          ),
        ),
        const SizedBox(width: 100),
        // Right side - Enhanced Visual
        Expanded(child: _buildEnhancedVisualSection(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _AnimatedBadge(),
        const SizedBox(height: 24),
        _GradientTitle(),
        const SizedBox(height: 20),
        Text(
          'With over 15 years of experience, we\'ve helped hundreds of businesses achieve remarkable growth through innovative solutions.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF6B7280),
            height: 1.8,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        _buildEnhancedVisualSection(context),
        const SizedBox(height: 40),
        _buildEnhancedFeatureList(context),
        const SizedBox(height: 32),
        _TrustIndicators(),
      ],
    );
  }

  Widget _buildEnhancedFeatureList(BuildContext context) {
    final features = [
      _EnhancedFeature(
        icon: Icons.verified_outlined,
        title: 'Quality Guaranteed',
        description:
            'Excellence in every project we deliver, backed by certifications',
        color: const Color(0xFF059669),
        badge: 'ISO 9001',
      ),
      _EnhancedFeature(
        icon: Icons.rocket_launch_outlined,
        title: 'Fast Turnaround',
        description: 'On-time delivery with agile methodologies',
        color: const Color(0xFF0891B2),
        badge: 'Agile',
      ),
      _EnhancedFeature(
        icon: Icons.psychology_outlined,
        title: 'Expert Team',
        description: 'Industry veterans with deep domain expertise',
        color: const Color(0xFF7C3AED),
        badge: '50+ Experts',
      ),
      _EnhancedFeature(
        icon: Icons.support_agent,
        title: '24/7 Support',
        description: 'Always here with multilingual support',
        color: const Color(0xFFDB2777),
        badge: 'Live',
      ),
    ];

    return Column(
      children: features
          .asMap()
          .entries
          .map((e) => _EnhancedFeatureItem(feature: e.value, index: e.key))
          .toList(),
    );
  }

  Widget _buildEnhancedVisualSection(BuildContext context) {
    return _AnimatedVisualCard();
  }
}

class _AnimatedBadge extends StatefulWidget {
  @override
  State<_AnimatedBadge> createState() => _AnimatedBadgeState();
}

class _AnimatedBadgeState extends State<_AnimatedBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.15),
                const Color(0xFF7C3AED).withOpacity(0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(
                0.3 + (_controller.value * 0.2),
              ),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(
                  0.1 + (_controller.value * 0.1),
                ),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.stars_rounded,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'WHY CHOOSE US',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GradientTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Theme.of(context).colorScheme.primary,
          const Color(0xFF047857),
        ],
      ).createShader(bounds),
      child: Text(
        'Solutions That Drive\nUnmatched Success',
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1.2,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}

class _EnhancedFeature {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final String badge;

  _EnhancedFeature({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.badge,
  });
}

class _EnhancedFeatureItem extends StatefulWidget {
  final _EnhancedFeature feature;
  final int index;

  const _EnhancedFeatureItem({required this.feature, required this.index});

  @override
  State<_EnhancedFeatureItem> createState() => _EnhancedFeatureItemState();
}

class _EnhancedFeatureItemState extends State<_EnhancedFeatureItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    // Stagger animations based on index
    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _slideAnimation.value,
          child: Transform.translate(
            offset: Offset(20 * (1 - _slideAnimation.value), 0),
            child: child,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? widget.feature.color.withOpacity(0.3)
                  : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.feature.color.withOpacity(0.15)
                    : Colors.black.withOpacity(0.03),
                blurRadius: _isHovered ? 30 : 10,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -4.0 : 0.0),
          child: Row(
            children: [
              // Icon container with gradient
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: _isHovered
                      ? LinearGradient(
                          colors: [
                            widget.feature.color,
                            widget.feature.color.withOpacity(0.7),
                          ],
                        )
                      : null,
                  color: _isHovered
                      ? null
                      : widget.feature.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: widget.feature.color.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  widget.feature.icon,
                  size: 28,
                  color: _isHovered ? Colors.white : widget.feature.color,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.feature.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1F2937),
                                ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: widget.feature.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.feature.badge,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: widget.feature.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.feature.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF6B7280),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              if (_isHovered)
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: widget.feature.color,
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedVisualCard extends StatefulWidget {
  @override
  State<_AnimatedVisualCard> createState() => _AnimatedVisualCardState();
}

class _AnimatedVisualCardState extends State<_AnimatedVisualCard>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _rotateController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _rotateController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_floatAnimation, _rotateController]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Container(
            height: 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.08),
                  const Color(0xFF7C3AED).withOpacity(0.08),
                ],
              ),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                // Rotating gradient background
                Positioned.fill(
                  child: Transform.rotate(
                    angle: _rotateController.value * 2 * 3.14159,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.05),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Animated stat boxes
                _AnimatedStatBox(
                  value: '15+',
                  label: 'Years',
                  color: Theme.of(context).colorScheme.primary,
                  top: 40,
                  left: 40,
                  delay: 0,
                ),
                _AnimatedStatBox(
                  value: '500+',
                  label: 'Clients',
                  color: const Color(0xFF0891B2),
                  top: 140,
                  right: 40,
                  delay: 200,
                ),
                _AnimatedStatBox(
                  value: '98%',
                  label: 'Satisfaction',
                  color: const Color(0xFF7C3AED),
                  bottom: 140,
                  left: 50,
                  delay: 400,
                ),
                _AnimatedStatBox(
                  value: '1200+',
                  label: 'Projects',
                  color: const Color(0xFFDB2777),
                  bottom: 50,
                  right: 50,
                  delay: 600,
                ),
                // Center achievement icon
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white.withOpacity(0.95)],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.2),
                          blurRadius: 60,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.workspace_premium,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedStatBox extends StatefulWidget {
  final String value;
  final String label;
  final Color color;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final int delay;

  const _AnimatedStatBox({
    required this.value,
    required this.label,
    required this.color,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.delay,
  });

  @override
  State<_AnimatedStatBox> createState() => _AnimatedStatBoxState();
}

class _AnimatedStatBoxState extends State<_AnimatedStatBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      bottom: widget.bottom,
      left: widget.left,
      right: widget.right,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  gradient: _isHovered
                      ? LinearGradient(
                          colors: [widget.color, widget.color.withOpacity(0.8)],
                        )
                      : null,
                  color: _isHovered ? null : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.color.withOpacity(_isHovered ? 0.5 : 0.2),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(_isHovered ? 0.4 : 0.2),
                      blurRadius: _isHovered ? 30 : 20,
                      offset: Offset(0, _isHovered ? 15 : 10),
                    ),
                  ],
                ),
                transform: Matrix4.identity()
                  ..translate(0.0, _isHovered ? -4.0 : 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.value,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: _isHovered ? Colors.white : widget.color,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _isHovered
                            ? Colors.white.withOpacity(0.9)
                            : const Color(0xFF6B7280),
                        fontWeight: FontWeight.w600,
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

class _TrustIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
            const Color(0xFF7C3AED).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TrustBadge(icon: Icons.security, label: 'Secure'),
          Container(
            width: 1,
            height: 30,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          _TrustBadge(icon: Icons.verified_user, label: 'Certified'),
          Container(
            width: 1,
            height: 30,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          _TrustBadge(icon: Icons.emoji_events, label: 'Award Winner'),
        ],
      ),
    );
  }
}

class _TrustBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TrustBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF374151),
          ),
        ),
      ],
    );
  }
}
