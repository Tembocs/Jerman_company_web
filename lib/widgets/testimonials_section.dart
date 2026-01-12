import 'package:flutter/material.dart';

/// Professional testimonials section with client reviews.
class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 64 : 100,
        horizontal: 24,
      ),
      color: Colors.white,
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
                  'TESTIMONIALS',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'What Our Clients Say',
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
                  'Don\'t just take our word for it. Here\'s what our valued clients have to say about working with us.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF6B7280),
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              // Testimonials
              LayoutBuilder(
                builder: (context, constraints) {
                  if (isSmallScreen) {
                    return const Column(
                      children: [
                        _TestimonialCard(
                          name: 'Jonathan Edward',
                          role: 'CEO, Mananger of the Company',
                          content:
                              'JERMAN COMPANY transformed our business operations. Their expertise and dedication to excellence is unmatched. Highly recommended!',
                          rating: 5,
                        ),
                        SizedBox(height: 24),
                        _TestimonialCard(
                          name: 'Kelvin Simon',
                          role: 'Director, Green Solutions Ltd',
                          content:
                              'Professional, reliable, and results-driven. They delivered beyond our expectations and continue to support our growth.',
                          rating: 5,
                        ),
                        SizedBox(height: 24),
                        _TestimonialCard(
                          name: 'Edgar Omondi',
                          role: 'Founder, Swift Logistics',
                          content:
                              'Working with JERMAN COMPANY has been a game-changer. Their strategic insights helped us scale efficiently.',
                          rating: 5,
                        ),
                      ],
                    );
                  }
                  return const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _TestimonialCard(
                          name: 'Jonathan Edward',
                          role: 'CEO, Mananger of the Company',
                          content:
                              'JERMAN COMPANY transformed our business operations. Their expertise and dedication to excellence is unmatched. Highly recommended!',
                          rating: 5,
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: _TestimonialCard(
                          name: 'Kelvin Simon',
                          role: 'Director, Green Solutions Ltd',
                          content:
                              'Professional, reliable, and results-driven. They delivered beyond our expectations and continue to support our growth.',
                          rating: 5,
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: _TestimonialCard(
                          name: 'Edgar Omondi',
                          role: 'Founder, Swift Logistics',
                          content:
                              'Working with JERMAN COMPANY has been a game-changer. Their strategic insights helped us scale efficiently.',
                          rating: 5,
                        ),
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

class _TestimonialCard extends StatefulWidget {
  final String name;
  final String role;
  final String content;
  final int rating;

  const _TestimonialCard({
    required this.name,
    required this.role,
    required this.content,
    required this.rating,
  });

  @override
  State<_TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<_TestimonialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: _isHovered
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                  : Colors.transparent,
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quote Icon
            Icon(
              Icons.format_quote,
              size: 40,
              color: _isHovered
                  ? Colors.white.withOpacity(0.5)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            // Stars
            Row(
              children: List.generate(
                widget.rating,
                (index) => Icon(
                  Icons.star,
                  size: 20,
                  color: _isHovered ? Colors.amber[300] : Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Content
            Text(
              widget.content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: _isHovered ? Colors.white : const Color(0xFF374151),
                height: 1.7,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            // Author
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: _isHovered
                      ? Colors.white.withOpacity(0.2)
                      : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  child: Text(
                    widget.name[0],
                    style: TextStyle(
                      color: _isHovered
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: _isHovered
                            ? Colors.white
                            : const Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      widget.role,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _isHovered
                            ? Colors.white70
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
