import 'package:flutter/material.dart';
import '../widgets/site_scaffold.dart';

/// Professional About page with company information and team section.
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      child: Column(
        children: [
          _HeroSection(),
          _StorySection(),
          _MissionVisionSection(),
          _CoreValuesSection(),
          _TeamSection(),
          _TimelineSection(),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 80 : 120,
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
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ABOUT US',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Building Success Together',
                style:
                    (isSmallScreen
                            ? Theme.of(context).textTheme.headlineLarge
                            : Theme.of(context).textTheme.displaySmall)
                        ?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'We are a passionate team dedicated to helping businesses thrive through innovative solutions and exceptional service.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 64 : 100,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isSmallScreen
              ? Column(
                  children: [
                    _buildStoryImage(context),
                    const SizedBox(height: 40),
                    _buildStoryContent(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildStoryImage(context)),
                    const SizedBox(width: 80),
                    Expanded(child: _buildStoryContent(context)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildStoryImage(BuildContext context) {
    return Container(
      height: 400,
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
          Positioned(
            top: 40,
            left: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    '2010',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Founded',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(40),
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
                Icons.apartment,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'OUR STORY',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'A Journey of Excellence',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'JERMAN COMPANY was founded in 2010 with a vision to provide professional services that businesses and individuals can rely on. Over the years, we have grown to become a trusted partner for clients across Tanzania and beyond.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF6B7280),
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our journey has been marked by a commitment to quality, integrity, and customer satisfaction. Today, we serve over 500 clients and have completed more than 1,200 successful projects.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: const Color(0xFF6B7280),
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

class _MissionVisionSection extends StatelessWidget {
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
              ? Column(
                  children: [
                    _MissionVisionCard(
                      icon: Icons.flag,
                      title: 'Our Mission',
                      description:
                          'To deliver exceptional services that exceed client expectations, fostering long-term relationships built on trust and mutual success. We strive to be the partner of choice for businesses seeking reliable, innovative solutions.',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 24),
                    _MissionVisionCard(
                      icon: Icons.visibility,
                      title: 'Our Vision',
                      description:
                          'To be the leading provider of professional services in the region, recognized for innovation, quality, and customer-centric approach. We envision a future where every business can access world-class solutions.',
                      color: const Color(0xFF7C3AED),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _MissionVisionCard(
                        icon: Icons.flag,
                        title: 'Our Mission',
                        description:
                            'To deliver exceptional services that exceed client expectations, fostering long-term relationships built on trust and mutual success. We strive to be the partner of choice for businesses seeking reliable, innovative solutions.',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: _MissionVisionCard(
                        icon: Icons.visibility,
                        title: 'Our Vision',
                        description:
                            'To be the leading provider of professional services in the region, recognized for innovation, quality, and customer-centric approach. We envision a future where every business can access world-class solutions.',
                        color: const Color(0xFF7C3AED),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _MissionVisionCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _MissionVisionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<_MissionVisionCard> createState() => _MissionVisionCardState();
}

class _MissionVisionCardState extends State<_MissionVisionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: widget.color.withOpacity(_isHovered ? 0.3 : 0.1),
              blurRadius: _isHovered ? 30 : 20,
              offset: Offset(0, _isHovered ? 15 : 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isHovered
                    ? Colors.white.withOpacity(0.2)
                    : widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: _isHovered ? Colors.white : widget.color,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: _isHovered ? Colors.white : const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: _isHovered
                    ? Colors.white.withOpacity(0.9)
                    : const Color(0xFF6B7280),
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoreValuesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    final values = [
      _Value(
        Icons.verified,
        'Integrity',
        'Honest and transparent in all dealings',
      ),
      _Value(
        Icons.workspace_premium,
        'Excellence',
        'Delivering the highest quality',
      ),
      _Value(
        Icons.lightbulb,
        'Innovation',
        'Creative solutions for modern challenges',
      ),
      _Value(Icons.groups, 'Teamwork', 'Stronger together, always'),
      _Value(Icons.favorite, 'Customer Focus', 'Your success is our priority'),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 64 : 100,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
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
                  'OUR VALUES',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'What We Stand For',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: values.map((v) => _ValueCard(value: v)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Value {
  final IconData icon;
  final String title;
  final String description;

  _Value(this.icon, this.title, this.description);
}

class _ValueCard extends StatefulWidget {
  final _Value value;

  const _ValueCard({required this.value});

  @override
  State<_ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<_ValueCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSmallScreen ? double.infinity : 220,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -5))
            : Matrix4.identity(),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isHovered
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                widget.value.icon,
                size: 28,
                color: _isHovered
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.value.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.value.description,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6B7280)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    final teamMembers = [
      _TeamMember(
        name: 'John Jerman',
        role: 'Founder & CEO',
        icon: Icons.person,
        color: const Color(0xFF059669),
      ),
      _TeamMember(
        name: 'Sarah Mwanga',
        role: 'Operations Director',
        icon: Icons.person,
        color: const Color(0xFF0891B2),
      ),
      _TeamMember(
        name: 'Michael Kimaro',
        role: 'Technical Lead',
        icon: Icons.person,
        color: const Color(0xFF7C3AED),
      ),
      _TeamMember(
        name: 'Grace Mollel',
        role: 'Client Relations',
        icon: Icons.person,
        color: const Color(0xFFDB2777),
      ),
    ];

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
                  'OUR TEAM',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Meet the Experts',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Our talented team brings diverse expertise and passion to every project.',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF6B7280)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: teamMembers
                    .map((m) => _TeamMemberCard(member: m))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMember {
  final String name;
  final String role;
  final IconData icon;
  final Color color;

  _TeamMember({
    required this.name,
    required this.role,
    required this.icon,
    required this.color,
  });
}

class _TeamMemberCard extends StatefulWidget {
  final _TeamMember member;

  const _TeamMemberCard({required this.member});

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSmallScreen ? double.infinity : 260,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: widget.member.color.withOpacity(_isHovered ? 0.2 : 0.05),
              blurRadius: _isHovered ? 30 : 15,
              offset: Offset(0, _isHovered ? 15 : 8),
            ),
          ],
        ),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: _isHovered
                    ? widget.member.color
                    : widget.member.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                widget.member.icon,
                size: 48,
                color: _isHovered ? Colors.white : widget.member.color,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.member.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.member.role,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: widget.member.color,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(Icons.email, widget.member.color),
                const SizedBox(width: 12),
                _SocialIcon(Icons.link, widget.member.color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _SocialIcon(this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    final milestones = [
      _Milestone(
        '2010',
        'Founded',
        'Started with a vision to serve businesses',
      ),
      _Milestone('2013', 'Expansion', 'Opened regional offices'),
      _Milestone('2016', '100 Clients', 'Reached our first major milestone'),
      _Milestone('2019', 'Digital Transformation', 'Launched online services'),
      _Milestone(
        '2024',
        '500+ Clients',
        'Serving businesses across the region',
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 64 : 100,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
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
                  'OUR JOURNEY',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Milestones',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              isSmallScreen
                  ? Column(
                      children: milestones
                          .map((m) => _MilestoneCard(milestone: m))
                          .toList(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: milestones
                          .map(
                            (m) =>
                                Expanded(child: _MilestoneCard(milestone: m)),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Milestone {
  final String year;
  final String title;
  final String description;

  _Milestone(this.year, this.title, this.description);
}

class _MilestoneCard extends StatelessWidget {
  final _Milestone milestone;

  const _MilestoneCard({required this.milestone});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 20 : 16),
      margin: EdgeInsets.only(bottom: isSmallScreen ? 16 : 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              milestone.year,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            milestone.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            milestone.description,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6B7280)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
