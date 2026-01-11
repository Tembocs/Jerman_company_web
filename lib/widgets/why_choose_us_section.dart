import 'package:flutter/material.dart';

/// "Why Choose Us" section with bullet points.
class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'Why Choose Us',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Here\'s what sets us apart from the competition.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _ReasonCard(
                    icon: Icons.verified,
                    title: 'Quality Guaranteed',
                    description:
                        'We deliver excellence in every project we undertake.',
                    isSmall: isSmallScreen,
                  ),
                  _ReasonCard(
                    icon: Icons.schedule,
                    title: 'On-Time Delivery',
                    description:
                        'We respect deadlines and deliver projects on schedule.',
                    isSmall: isSmallScreen,
                  ),
                  _ReasonCard(
                    icon: Icons.people,
                    title: 'Experienced Team',
                    description:
                        'Our professionals have years of industry experience.',
                    isSmall: isSmallScreen,
                  ),
                  _ReasonCard(
                    icon: Icons.attach_money,
                    title: 'Competitive Pricing',
                    description:
                        'Quality services at prices that fit your budget.',
                    isSmall: isSmallScreen,
                  ),
                  _ReasonCard(
                    icon: Icons.support,
                    title: '24/7 Support',
                    description:
                        'Our support team is always available to help you.',
                    isSmall: isSmallScreen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReasonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isSmall;

  const _ReasonCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isSmall,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmall ? double.infinity : 320,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
