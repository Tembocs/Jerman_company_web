import 'package:flutter/material.dart';

/// Ultra-professional testimonials section with advanced animations and effects.
class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, const Color(0xFFFAFAFA)],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -100,
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
            bottom: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
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
                child: Column(
                  children: [
                    // Section Header
                    _AnimatedSectionHeader(),
                    const SizedBox(height: 70),
                    // Featured Testimonial
                    _FeaturedTestimonial(),
                    const SizedBox(height: 50),
                    // Testimonials Grid
                    _TestimonialsGrid(isSmallScreen: isSmallScreen),
                    const SizedBox(height: 60),
                    // Client Logos
                    _ClientLogosBar(),
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
        // Badge with animation
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                const Color(0xFFDB2777).withOpacity(0.1),
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
              Icon(Icons.favorite, size: 16, color: const Color(0xFFDB2777)),
              const SizedBox(width: 8),
              Text(
                'CLIENT TESTIMONIALS',
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
            'Trusted by Industry Leaders',
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
                    const Color(0xFFDB2777),
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
            'Don\'t just take our word for it. Hear directly from our valued clients about their transformative experiences working with us.',
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

class _FeaturedTestimonial extends StatefulWidget {
  @override
  State<_FeaturedTestimonial> createState() => _FeaturedTestimonialState();
}

class _FeaturedTestimonialState extends State<_FeaturedTestimonial> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.primary.withOpacity(_isHovered ? 0.4 : 0.3),
              blurRadius: _isHovered ? 50 : 40,
              offset: Offset(0, _isHovered ? 25 : 20),
            ),
          ],
        ),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -4.0 : 0.0),
        child: Stack(
          children: [
            // Decorative quote
            Positioned(
              top: 0,
              right: isSmallScreen ? 0 : 40,
              child: Icon(
                Icons.format_quote,
                size: isSmallScreen ? 80 : 120,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber[300]),
                          const SizedBox(width: 6),
                          const Text(
                            'FEATURED REVIEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Stars
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.star,
                        size: 24,
                        color: Colors.amber[300],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '"JERMAN COMPANY has been instrumental in transforming our business operations. Their strategic insights, dedication to excellence, and innovative approach have helped us achieve remarkable growth. I cannot recommend them highly enough to any business looking to scale and succeed."',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: const Text(
                          'JE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jonathan Edward',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'CEO & Manager of the Company',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isSmallScreen)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified,
                              size: 16,
                              color: Colors.white.withOpacity(0.9),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Verified Client',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
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

class _TestimonialsGrid extends StatelessWidget {
  final bool isSmallScreen;

  const _TestimonialsGrid({required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      _Testimonial(
        name: 'Kelvin Simon',
        role: 'Director, Green Solutions Ltd',
        content:
            'Professional, reliable, and results-driven. They delivered beyond our expectations and continue to support our growth journey.',
        rating: 5,
        color: const Color(0xFF0891B2),
        initials: 'KS',
      ),
      _Testimonial(
        name: 'Edgar Omondi',
        role: 'Founder, Swift Logistics',
        content:
            'Working with JERMAN COMPANY has been a game-changer. Their strategic insights helped us scale efficiently and profitably.',
        rating: 5,
        color: const Color(0xFF7C3AED),
        initials: 'EO',
      ),
      _Testimonial(
        name: 'Mary Kimani',
        role: 'CFO, TechVentures Africa',
        content:
            'Their attention to detail and commitment to quality is exceptional. A truly world-class team that delivers results.',
        rating: 5,
        color: const Color(0xFFDB2777),
        initials: 'MK',
      ),
      _Testimonial(
        name: 'Moses Bulemo',
        role: 'CFO, Director of TechVentures',
        content:
            'Their attention to detail and commitment to quality is exceptional. A truly world-class team that delivers results.',
        rating: 4,
        color: const Color.fromARGB(255, 219, 39, 39),
        initials: 'MB',
      ),
    ];

    if (isSmallScreen) {
      return Column(
        children: testimonials
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _UltraTestimonialCard(
                  testimonial: e.value,
                  index: e.key,
                ),
              ),
            )
            .toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: testimonials
          .asMap()
          .entries
          .map(
            (e) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: e.key == 0 ? 0 : 12,
                  right: e.key == testimonials.length - 1 ? 0 : 12,
                ),
                child: _UltraTestimonialCard(
                  testimonial: e.value,
                  index: e.key,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Testimonial {
  final String name;
  final String role;
  final String content;
  final int rating;
  final Color color;
  final String initials;

  _Testimonial({
    required this.name,
    required this.role,
    required this.content,
    required this.rating,
    required this.color,
    required this.initials,
  });
}

class _UltraTestimonialCard extends StatefulWidget {
  final _Testimonial testimonial;
  final int index;

  const _UltraTestimonialCard({required this.testimonial, required this.index});

  @override
  State<_UltraTestimonialCard> createState() => _UltraTestimonialCardState();
}

class _UltraTestimonialCardState extends State<_UltraTestimonialCard>
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
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: _isHovered ? widget.testimonial.color : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _isHovered
                      ? widget.testimonial.color
                      : const Color(0xFFE5E7EB),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? widget.testimonial.color.withOpacity(0.35)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: _isHovered ? 40 : 20,
                    offset: Offset(0, _isHovered ? 20 : 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row with quote and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? Colors.white.withOpacity(0.2)
                              : widget.testimonial.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.format_quote,
                          size: 24,
                          color: _isHovered
                              ? Colors.white
                              : widget.testimonial.color,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          widget.testimonial.rating,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: _isHovered
                                  ? Colors.amber[200]
                                  : Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Content
                  Text(
                    '"${widget.testimonial.content}"',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: _isHovered
                          ? Colors.white
                          : const Color(0xFF374151),
                      height: 1.7,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Divider
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 1,
                    color: _isHovered
                        ? Colors.white.withOpacity(0.2)
                        : const Color(0xFFE5E7EB),
                  ),
                  const SizedBox(height: 20),
                  // Author
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _isHovered
                                ? Colors.white.withOpacity(0.5)
                                : widget.testimonial.color.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: _isHovered
                              ? Colors.white.withOpacity(0.2)
                              : widget.testimonial.color.withOpacity(0.1),
                          child: Text(
                            widget.testimonial.initials,
                            style: TextStyle(
                              color: _isHovered
                                  ? Colors.white
                                  : widget.testimonial.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.testimonial.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: _isHovered
                                        ? Colors.white
                                        : const Color(0xFF1F2937),
                                  ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.testimonial.role,
                              style: TextStyle(
                                color: _isHovered
                                    ? Colors.white.withOpacity(0.8)
                                    : const Color(0xFF6B7280),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ClientLogosBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Column(
      children: [
        Text(
          'TRUSTED BY LEADING COMPANIES',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: const Color(0xFF9CA3AF),
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 24 : 48,
            vertical: 32,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: isSmallScreen
              ? Wrap(
                  spacing: 32,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _LogoPlaceholder('TechCorp'),
                    _LogoPlaceholder('InnovateTZ'),
                    _LogoPlaceholder('GlobalReach'),
                    _LogoPlaceholder('FutureBuild'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _LogoPlaceholder('TechCorp'),
                    _LogoPlaceholder('InnovateTZ'),
                    _LogoPlaceholder('GlobalReach'),
                    _LogoPlaceholder('FutureBuild'),
                    _LogoPlaceholder('ScaleUp'),
                  ],
                ),
        ),
      ],
    );
  }
}

class _LogoPlaceholder extends StatefulWidget {
  final String name;

  const _LogoPlaceholder(this.name);

  @override
  State<_LogoPlaceholder> createState() => _LogoPlaceholderState();
}

class _LogoPlaceholderState extends State<_LogoPlaceholder> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFF9CA3AF),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          child: Text(widget.name),
        ),
      ),
    );
  }
}
