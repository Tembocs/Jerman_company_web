import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/site_scaffold.dart';

/// Services page with detailed service listings.
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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
              children: [
                // Page Header
                Text(
                  'Our Services',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Comprehensive solutions tailored to your needs.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Services Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = isSmallScreen ? 1 : 2;
                    return GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio: isSmallScreen ? 1.8 : 1.4,
                      children: const [
                        _ServiceDetailCard(
                          icon: Icons.engineering,
                          title: 'Service 1',
                          description:
                              'Detailed description of Service 1. We provide comprehensive solutions '
                              'that help businesses achieve their goals efficiently and effectively.',
                          features: ['Feature A', 'Feature B', 'Feature C'],
                        ),
                        _ServiceDetailCard(
                          icon: Icons.analytics,
                          title: 'Service 2',
                          description:
                              'Detailed description of Service 2. Our team of experts delivers '
                              'high-quality results that exceed expectations.',
                          features: ['Feature A', 'Feature B', 'Feature C'],
                        ),
                        _ServiceDetailCard(
                          icon: Icons.support_agent,
                          title: 'Service 3',
                          description:
                              'Detailed description of Service 3. We are committed to providing '
                              'exceptional support and service to all our clients.',
                          features: ['Feature A', 'Feature B', 'Feature C'],
                        ),
                        _ServiceDetailCard(
                          icon: Icons.build,
                          title: 'Service 4',
                          description:
                              'Detailed description of Service 4. Our innovative approach ensures '
                              'that we stay ahead of industry trends.',
                          features: ['Feature A', 'Feature B', 'Feature C'],
                        ),
                        _ServiceDetailCard(
                          icon: Icons.security,
                          title: 'Service 5',
                          description:
                              'Detailed description of Service 5. Security and reliability are '
                              'at the core of everything we do.',
                          features: ['Feature A', 'Feature B', 'Feature C'],
                        ),
                        _ServiceDetailCard(
                          icon: Icons.cloud,
                          title: 'Service 6',
                          description:
                              'Detailed description of Service 6. We leverage modern technology '
                              'to deliver scalable solutions.',
                          features: ['Feature A', 'Feature B', 'Feature C'],
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 48),

                // CTA Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Need a Custom Solution?',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Contact us to discuss your specific requirements.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => context.go('/contact'),
                        icon: const Icon(Icons.contact_mail),
                        label: const Text('Get in Touch'),
                      ),
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

class _ServiceDetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;

  const _ServiceDetailCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
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
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: features
                  .map(
                    (feature) => Chip(
                      label: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      padding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
