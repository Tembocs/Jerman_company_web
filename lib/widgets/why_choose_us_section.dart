import 'package:flutter/material.dart';

/// Professional "Why Choose Us" section.
class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 64 : 100,
        horizontal: 24,
      ),
      color: const Color(0xFFF9FAFB),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isSmallScreen
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side - Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'WHY CHOOSE US',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'We Bring Solutions\nThat Drive Success',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'With over 15 years of experience, we\'ve helped hundreds of businesses achieve their goals through innovative solutions and dedicated service.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF6B7280),
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 40),
              _buildFeatureList(context),
            ],
          ),
        ),
        const SizedBox(width: 80),
        // Right side - Image/Visual
        Expanded(child: _buildVisualSection(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'WHY CHOOSE US',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'We Bring Solutions That Drive Success',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2937),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'With over 15 years of experience, we\'ve helped hundreds of businesses achieve their goals.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF6B7280),
            height: 1.7,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        _buildFeatureList(context),
      ],
    );
  }

  Widget _buildFeatureList(BuildContext context) {
    final features = [
      _Feature(
        icon: Icons.verified,
        title: 'Quality Guaranteed',
        description: 'Excellence in every project we deliver',
      ),
      _Feature(
        icon: Icons.speed,
        title: 'Fast Turnaround',
        description: 'On-time delivery, every time',
      ),
      _Feature(
        icon: Icons.groups,
        title: 'Expert Team',
        description: 'Industry veterans at your service',
      ),
      _Feature(
        icon: Icons.support_agent,
        title: '24/7 Support',
        description: 'Always here when you need us',
      ),
    ];

    return Column(
      children: features
          .map((feature) => _FeatureItem(feature: feature))
          .toList(),
    );
  }

  Widget _buildVisualSection(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Decorative elements
          Positioned(
            top: 40,
            left: 40,
            child: _StatBox(
              value: '15+',
              label: 'Years',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            top: 120,
            right: 40,
            child: _StatBox(
              value: '500+',
              label: 'Clients',
              color: const Color(0xFF0891B2),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 60,
            child: _StatBox(
              value: '98%',
              label: 'Satisfaction',
              color: const Color(0xFF7C3AED),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 60,
            child: _StatBox(
              value: '1200+',
              label: 'Projects',
              color: const Color(0xFFDB2777),
            ),
          ),
          // Center icon
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Icon(
                Icons.business,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String description;

  _Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class _FeatureItem extends StatefulWidget {
  final _Feature feature;

  const _FeatureItem({required this.feature});

  @override
  State<_FeatureItem> createState() => _FeatureItemState();
}

class _FeatureItemState extends State<_FeatureItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.feature.icon,
                size: 24,
                color: _isHovered
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.feature.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.feature.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatBox({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6B7280)),
          ),
        ],
      ),
    );
  }
}
