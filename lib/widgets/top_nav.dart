import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Ultra-professional responsive top navigation bar with animations and effects.
class TopNav extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const TopNav({super.key, this.scaffoldKey});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  bool _isScrolled = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    final currentPath = GoRouterState.of(context).uri.path;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _isScrolled
            ? Theme.of(context).colorScheme.surface.withOpacity(0.95)
            : Theme.of(context).colorScheme.surface,
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: SafeArea(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32),
          child: Row(
            children: [
              // Mobile menu button
              if (isSmallScreen)
                _AnimatedMenuButton(
                  onPressed: () =>
                      widget.scaffoldKey?.currentState?.openDrawer(),
                ),
              // Logo
              _AnimatedLogo(),
              const Spacer(),
              // Desktop Navigation
              if (!isSmallScreen) ...[
                _UltraNavButton(
                  label: 'Home',
                  path: '/',
                  isActive: currentPath == '/',
                  icon: Icons.home_outlined,
                ),
                _UltraNavButton(
                  label: 'About',
                  path: '/about',
                  isActive: currentPath == '/about',
                  icon: Icons.info_outlined,
                ),
                _UltraNavButton(
                  label: 'Services',
                  path: '/services',
                  isActive: currentPath == '/services',
                  icon: Icons.design_services_outlined,
                ),
                _UltraNavButton(
                  label: 'Contact',
                  path: '/contact',
                  isActive: currentPath == '/contact',
                  icon: Icons.mail_outlined,
                ),
                const SizedBox(width: 16),
                _ContactButton(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedMenuButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _AnimatedMenuButton({required this.onPressed});

  @override
  State<_AnimatedMenuButton> createState() => _AnimatedMenuButtonState();
}

class _AnimatedMenuButtonState extends State<_AnimatedMenuButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                  : Colors.transparent,
            ),
          ),
          child: Icon(
            Icons.menu_rounded,
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFF374151),
            size: 24,
          ),
        ),
      ),
    );
  }
}

class _AnimatedLogo extends StatefulWidget {
  @override
  State<_AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<_AnimatedLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go('/'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo with gradient border
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      const Color(0xFF047857),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 38,
                      width: 38,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              const Color(0xFF047857),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.business,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        const Color(0xFF047857),
                      ],
                    ).createShader(bounds),
                    child: Text(
                      'JERMAN',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        height: 1,
                      ),
                    ),
                  ),
                  Text(
                    'COMPANY',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6B7280),
                      letterSpacing: 2,
                      fontSize: 10,
                    ),
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

class _UltraNavButton extends StatefulWidget {
  final String label;
  final String path;
  final bool isActive;
  final IconData icon;

  const _UltraNavButton({
    required this.label,
    required this.path,
    required this.isActive,
    required this.icon,
  });

  @override
  State<_UltraNavButton> createState() => _UltraNavButtonState();
}

class _UltraNavButtonState extends State<_UltraNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.path),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isActive
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : (_isHovered
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
                      : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isActive
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isActive || _isHovered)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Icon(
                    widget.icon,
                    size: 16,
                    color: widget.isActive
                        ? Theme.of(context).colorScheme.primary
                        : const Color(0xFF6B7280),
                  ),
                ),
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: widget.isActive
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: widget.isActive
                      ? Theme.of(context).colorScheme.primary
                      : (_isHovered
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0xFF374151)),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go('/contact'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered
                  ? [
                      const Color(0xFF047857),
                      Theme.of(context).colorScheme.primary,
                    ]
                  : [
                      Theme.of(context).colorScheme.primary,
                      const Color(0xFF047857),
                    ],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(_isHovered ? 0.4 : 0.2),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -2))
              : Matrix4.identity(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.phone, size: 16, color: Colors.white),
              const SizedBox(width: 8),
              const Text(
                'Get in Touch',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Ultra-professional navigation drawer for mobile screens.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header with gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  const Color(0xFF047857),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.business,
                        color: Theme.of(context).colorScheme.primary,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'JERMAN COMPANY',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Excellence in Service',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _UltraDrawerItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  path: '/',
                  isActive: currentPath == '/',
                  color: const Color(0xFF059669),
                ),
                _UltraDrawerItem(
                  icon: Icons.info_rounded,
                  label: 'About Us',
                  path: '/about',
                  isActive: currentPath == '/about',
                  color: const Color(0xFF0891B2),
                ),
                _UltraDrawerItem(
                  icon: Icons.design_services_rounded,
                  label: 'Our Services',
                  path: '/services',
                  isActive: currentPath == '/services',
                  color: const Color(0xFF7C3AED),
                ),
                _UltraDrawerItem(
                  icon: Icons.mail_rounded,
                  label: 'Contact',
                  path: '/contact',
                  isActive: currentPath == '/contact',
                  color: const Color(0xFFDB2777),
                ),
              ],
            ),
          ),
          // Footer
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Need Help?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+255 123 456 789',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialIcon(Icons.facebook),
                    _SocialIcon(Icons.link),
                    _SocialIcon(Icons.email),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UltraDrawerItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String path;
  final bool isActive;
  final Color color;

  const _UltraDrawerItem({
    required this.icon,
    required this.label,
    required this.path,
    required this.isActive,
    required this.color,
  });

  @override
  State<_UltraDrawerItem> createState() => _UltraDrawerItemState();
}

class _UltraDrawerItemState extends State<_UltraDrawerItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        Navigator.of(context).pop();
        context.go(widget.path);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: widget.isActive
              ? widget.color.withOpacity(0.1)
              : (_isPressed ? const Color(0xFFF3F4F6) : Colors.transparent),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: widget.isActive
                ? widget.color.withOpacity(0.3)
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: widget.isActive
                    ? widget.color
                    : widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                widget.icon,
                size: 20,
                color: widget.isActive ? Colors.white : widget.color,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                widget.label,
                style: TextStyle(
                  fontWeight: widget.isActive
                      ? FontWeight.w700
                      : FontWeight.w500,
                  fontSize: 15,
                  color: widget.isActive
                      ? widget.color
                      : const Color(0xFF374151),
                ),
              ),
            ),
            if (widget.isActive)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 12, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;

  const _SocialIcon(this.icon);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            widget.icon,
            size: 18,
            color: _isHovered ? Colors.white : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}
