import 'package:flutter/material.dart';

/// Professional services section with hover effects.
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    final isMediumScreen = MediaQuery.of(context).size.width < 1024;

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
          child: Column(
            children: [
              // Section Header
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
                  'WHAT WE DO',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Our Services',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'We deliver comprehensive solutions designed to help your business grow and succeed in today\'s competitive market.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF6B7280),
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
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
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: isSmallScreen ? 1.8 : 1.1,
                    children: const [
                      _ProfessionalServiceCard(
                        icon: Icons.architecture,
                        title: 'Consulting',
                        description:
                            'Expert advice and strategic guidance to help you make informed business decisions.',
                        color: Color(0xFF059669),
                      ),
                      _ProfessionalServiceCard(
                        icon: Icons.trending_up,
                        title: 'Business Growth',
                        description:
                            'Proven strategies to accelerate your business growth and maximize revenue.',
                        color: Color(0xFF0891B2),
                      ),
                      _ProfessionalServiceCard(
                        icon: Icons.security,
                        title: 'Risk Management',
                        description:
                            'Comprehensive risk assessment and mitigation strategies for your enterprise.',
                        color: Color(0xFF7C3AED),
                      ),
                      _ProfessionalServiceCard(
                        icon: Icons.support_agent,
                        title: 'Customer Support',
                        description:
                            '24/7 dedicated support team ensuring your satisfaction at every step.',
                        color: Color(0xFFDB2777),
                      ),
                      _ProfessionalServiceCard(
                        icon: Icons.analytics,
                        title: 'Data Analytics',
                        description:
                            'Turn your data into actionable insights that drive better decisions.',
                        color: Color(0xFFEA580C),
                      ),
                      _ProfessionalServiceCard(
                        icon: Icons.integration_instructions,
                        title: 'Integration',
                        description:
                            'Seamless integration solutions connecting all your business systems.',
                        color: Color(0xFF0D9488),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfessionalServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _ProfessionalServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<_ProfessionalServiceCard> createState() =>
      _ProfessionalServiceCardState();
}

class _ProfessionalServiceCardState extends State<_ProfessionalServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.color.withOpacity(0.2)
                  : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 15 : 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? widget.color
                      : widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: _isHovered ? Colors.white : widget.color,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF6B7280),
                  height: 1.6,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isHovered ? 1 : 0,
                child: Row(
                  children: [
                    Text(
                      'Learn More',
                      style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 16, color: widget.color),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
