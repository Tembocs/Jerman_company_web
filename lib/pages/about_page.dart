import 'package:flutter/material.dart';
import '../widgets/site_scaffold.dart';

/// About page with company information.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return SiteScaffold(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 64,
          horizontal: isSmallScreen ? 24 : 48,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Page Header
                Center(
                  child: Column(
                    children: [
                      Text(
                        'About Us',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Learn more about our company and mission.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // Company Overview
                _SectionCard(
                  title: 'Our Story',
                  icon: Icons.history,
                  child: Text(
                    'JERMAN COMPANY was founded with a vision to provide professional '
                    'services that businesses and individuals can rely on. Over the years, '
                    'we have grown to become a trusted partner for clients across Tanzania '
                    'and beyond. Our journey has been marked by a commitment to quality, '
                    'integrity, and customer satisfaction.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.7,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Mission & Vision
                isSmallScreen
                    ? Column(
                        children: [
                          _SectionCard(
                            title: 'Our Mission',
                            icon: Icons.flag,
                            child: Text(
                              'To deliver exceptional services that exceed client expectations, '
                              'fostering long-term relationships built on trust and mutual success.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    height: 1.7,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          _SectionCard(
                            title: 'Our Vision',
                            icon: Icons.visibility,
                            child: Text(
                              'To be the leading provider of professional services in the region, '
                              'recognized for innovation, quality, and customer-centric approach.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    height: 1.7,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _SectionCard(
                              title: 'Our Mission',
                              icon: Icons.flag,
                              child: Text(
                                'To deliver exceptional services that exceed client expectations, '
                                'fostering long-term relationships built on trust and mutual success.',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      height: 1.7,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _SectionCard(
                              title: 'Our Vision',
                              icon: Icons.visibility,
                              child: Text(
                                'To be the leading provider of professional services in the region, '
                                'recognized for innovation, quality, and customer-centric approach.',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      height: 1.7,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 24),

                // Values
                _SectionCard(
                  title: 'Our Core Values',
                  icon: Icons.star,
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _ValueChip(label: 'Integrity', icon: Icons.verified),
                      _ValueChip(
                        label: 'Excellence',
                        icon: Icons.workspace_premium,
                      ),
                      _ValueChip(label: 'Innovation', icon: Icons.lightbulb),
                      _ValueChip(label: 'Teamwork', icon: Icons.groups),
                      _ValueChip(label: 'Customer Focus', icon: Icons.people),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _ValueChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _ValueChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
