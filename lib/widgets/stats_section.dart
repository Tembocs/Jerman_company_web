import 'package:flutter/material.dart';

/// Ultra-professional statistics section with stunning animations and effects.
class StatsSection extends StatefulWidget {
  const StatsSection({super.key});

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection>
    with TickerProviderStateMixin {
  late AnimationController _countController;
  late AnimationController _pulseController;
  late List<AnimationController> _cardControllers;

  @override
  void initState() {
    super.initState();
    _countController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _cardControllers = List.generate(
      4,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    // Staggered animation for cards
    Future.delayed(const Duration(milliseconds: 200), () {
      for (int i = 0; i < _cardControllers.length; i++) {
        Future.delayed(Duration(milliseconds: i * 150), () {
          if (mounted) _cardControllers[i].forward();
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _countController.forward();
    });
  }

  @override
  void dispose() {
    _countController.dispose();
    _pulseController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    final isMediumScreen = MediaQuery.of(context).size.width < 1024;

    final stats = [
      _StatData(
        endValue: 500,
        suffix: '+',
        label: 'Happy Clients',
        sublabel: 'Worldwide',
        icon: Icons.people_alt_rounded,
        color: const Color(0xFF059669),
      ),
      _StatData(
        endValue: 15,
        suffix: '+',
        label: 'Years Experience',
        sublabel: 'Industry Expertise',
        icon: Icons.emoji_events_rounded,
        color: const Color(0xFF0891B2),
      ),
      _StatData(
        endValue: 1200,
        suffix: '+',
        label: 'Projects Completed',
        sublabel: 'Successfully Delivered',
        icon: Icons.rocket_launch_rounded,
        color: const Color(0xFF7C3AED),
      ),
      _StatData(
        endValue: 98,
        suffix: '%',
        label: 'Satisfaction Rate',
        sublabel: 'Client Happiness',
        icon: Icons.favorite_rounded,
        color: const Color(0xFFDB2777),
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 60 : 100,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF059669),
            const Color(0xFF047857),
            const Color(0xFF065F46),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background decorative elements
          Positioned(
            top: -100,
            right: -100,
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (_pulseController.value * 0.1),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + ((1 - _pulseController.value) * 0.1),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.03),
                    ),
                  ),
                );
              },
            ),
          ),
          // Main content
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Section header
                  _buildSectionHeader(context, isSmallScreen),
                  SizedBox(height: isSmallScreen ? 40 : 60),
                  // Stats grid
                  isSmallScreen
                      ? Column(
                          children: List.generate(
                            stats.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: _UltraStatCard(
                                countController: _countController,
                                cardController: _cardControllers[index],
                                data: stats[index],
                                index: index,
                              ),
                            ),
                          ),
                        )
                      : Row(
                          children: List.generate(
                            stats.length,
                            (index) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMediumScreen ? 8 : 16,
                                ),
                                child: _UltraStatCard(
                                  countController: _countController,
                                  cardController: _cardControllers[index],
                                  data: stats[index],
                                  index: index,
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: isSmallScreen ? 40 : 60),
                  // Bottom trust badge
                  _buildTrustBadge(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isSmallScreen) {
    return Column(
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bar_chart_rounded, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                'OUR ACHIEVEMENTS',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Title
        Text(
          'Driving Success',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: isSmallScreen ? 32 : 44,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Through Excellence',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.white.withOpacity(0.8),
            fontSize: isSmallScreen ? 32 : 44,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Subtitle
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            'Numbers that reflect our commitment to delivering exceptional results and building lasting partnerships',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.8),
              fontSize: isSmallScreen ? 14 : 16,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildTrustBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Trusted by Fortune 500 companies and startups alike',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatData {
  final int endValue;
  final String suffix;
  final String label;
  final String sublabel;
  final IconData icon;
  final Color color;

  _StatData({
    required this.endValue,
    required this.suffix,
    required this.label,
    required this.sublabel,
    required this.icon,
    required this.color,
  });
}

class _UltraStatCard extends StatefulWidget {
  final AnimationController countController;
  final AnimationController cardController;
  final _StatData data;
  final int index;

  const _UltraStatCard({
    required this.countController,
    required this.cardController,
    required this.data,
    required this.index,
  });

  @override
  State<_UltraStatCard> createState() => _UltraStatCardState();
}

class _UltraStatCardState extends State<_UltraStatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.cardController,
      builder: (context, child) {
        final slideValue = Curves.elasticOut.transform(
          widget.cardController.value.clamp(0.0, 1.0),
        );
        final scaleValue = Curves.easeOutBack.transform(
          widget.cardController.value.clamp(0.0, 1.0),
        );

        return Transform.translate(
          offset: Offset(0, 50 * (1 - slideValue)),
          child: Opacity(
            opacity: widget.cardController.value.clamp(0.0, 1.0),
            child: Transform.scale(
              scale: 0.8 + (0.2 * scaleValue),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? Colors.white
                        : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: _isHovered
                          ? widget.data.color.withOpacity(0.3)
                          : Colors.white.withOpacity(0.15),
                      width: 2,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: widget.data.color.withOpacity(0.3),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ]
                        : [],
                  ),
                  transform: _isHovered
                      ? (Matrix4.identity()..translate(0.0, -8.0))
                      : Matrix4.identity(),
                  child: Column(
                    children: [
                      // Icon with animated background
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _isHovered
                                ? [
                                    widget.data.color,
                                    widget.data.color.withOpacity(0.8),
                                  ]
                                : [
                                    Colors.white.withOpacity(0.2),
                                    Colors.white.withOpacity(0.1),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: _isHovered
                              ? [
                                  BoxShadow(
                                    color: widget.data.color.withOpacity(0.4),
                                    blurRadius: 20,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Icon(
                          widget.data.icon,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Animated counter
                      AnimatedBuilder(
                        animation: widget.countController,
                        builder: (context, child) {
                          final value =
                              (widget.data.endValue *
                                      widget.countController.value)
                                  .round();
                          return Text(
                            '$value${widget.data.suffix}',
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: _isHovered
                                      ? widget.data.color
                                      : Colors.white,
                                  fontSize: 42,
                                ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      // Label
                      Text(
                        widget.data.label,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: _isHovered
                              ? const Color(0xFF1F2937)
                              : Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      // Sublabel
                      Text(
                        widget.data.sublabel,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _isHovered
                              ? const Color(0xFF6B7280)
                              : Colors.white.withOpacity(0.7),
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      // Progress indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? widget.data.color.withOpacity(0.2)
                              : Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: AnimatedBuilder(
                          animation: widget.countController,
                          builder: (context, child) {
                            return FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widget.countController.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: _isHovered
                                        ? [
                                            widget.data.color,
                                            widget.data.color.withOpacity(0.7),
                                          ]
                                        : [
                                            Colors.white,
                                            Colors.white.withOpacity(0.7),
                                          ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
