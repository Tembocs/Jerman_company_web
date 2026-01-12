import 'package:flutter/material.dart';

/// Statistics section showing company achievements.
class StatsSection extends StatefulWidget {
  const StatsSection({super.key});

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 48 : 80,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'Our Impact in Numbers',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Wrap(
                spacing: 60,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  _AnimatedStat(
                    controller: _controller,
                    endValue: 500,
                    suffix: '+',
                    label: 'Happy Clients',
                    icon: Icons.people,
                  ),
                  _AnimatedStat(
                    controller: _controller,
                    endValue: 15,
                    suffix: '+',
                    label: 'Years Experience',
                    icon: Icons.calendar_month,
                  ),
                  _AnimatedStat(
                    controller: _controller,
                    endValue: 1200,
                    suffix: '+',
                    label: 'Projects Completed',
                    icon: Icons.task_alt,
                  ),
                  _AnimatedStat(
                    controller: _controller,
                    endValue: 98,
                    suffix: '%',
                    label: 'Satisfaction Rate',
                    icon: Icons.thumb_up,
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

class _AnimatedStat extends StatelessWidget {
  final AnimationController controller;
  final int endValue;
  final String suffix;
  final String label;
  final IconData icon;

  const _AnimatedStat({
    required this.controller,
    required this.endValue,
    required this.suffix,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = (endValue * controller.value).round();
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              '$value$suffix',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
