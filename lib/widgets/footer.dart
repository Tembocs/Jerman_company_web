import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Professional multi-column footer.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF111827)),
      child: Column(
        children: [
          // Main Footer Content
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 48 : 80,
              horizontal: 24,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isSmallScreen
                    ? _buildMobileFooter(context)
                    : _buildDesktopFooter(context),
              ),
            ),
          ),
          // Bottom Bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 24,
                  runSpacing: 16,
                  children: [
                    Text(
                      '© $year JERMAN COMPANY. All rights reserved.',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white54),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _FooterBottomLink(text: 'Privacy Policy', onTap: () {}),
                        const SizedBox(width: 24),
                        _FooterBottomLink(
                          text: 'Terms of Service',
                          onTap: () {},
                        ),
                        const SizedBox(width: 24),
                        _FooterBottomLink(text: 'Cookies', onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand Column
        Expanded(flex: 2, child: _buildBrandColumn(context)),
        const SizedBox(width: 48),
        // Quick Links
        Expanded(
          child: _buildLinksColumn(
            context,
            title: 'Quick Links',
            links: [
              _FooterLink(text: 'Home', path: '/'),
              _FooterLink(text: 'About Us', path: '/about'),
              _FooterLink(text: 'Services', path: '/services'),
              _FooterLink(text: 'Contact', path: '/contact'),
            ],
          ),
        ),
        // Services
        Expanded(
          child: _buildLinksColumn(
            context,
            title: 'Services',
            links: [
              _FooterLink(text: 'Consulting', path: '/services'),
              _FooterLink(text: 'Business Growth', path: '/services'),
              _FooterLink(text: 'Risk Management', path: '/services'),
              _FooterLink(text: 'Data Analytics', path: '/services'),
            ],
          ),
        ),
        // Contact Info
        Expanded(child: _buildContactColumn(context)),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        _buildBrandColumn(context),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLinksColumn(
                context,
                title: 'Quick Links',
                links: [
                  _FooterLink(text: 'Home', path: '/'),
                  _FooterLink(text: 'About Us', path: '/about'),
                  _FooterLink(text: 'Services', path: '/services'),
                  _FooterLink(text: 'Contact', path: '/contact'),
                ],
              ),
            ),
            Expanded(child: _buildContactColumn(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildBrandColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.business, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            Text(
              'JERMAN COMPANY',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Delivering excellence and professional services you can trust. Your success is our commitment.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.white60, height: 1.7),
        ),
        const SizedBox(height: 24),
        // Social Icons
        Row(
          children: [
            _SocialIcon(icon: Icons.facebook, onTap: () {}),
            const SizedBox(width: 12),
            _SocialIcon(icon: Icons.link, onTap: () {}),
            const SizedBox(width: 12),
            _SocialIcon(icon: Icons.camera_alt, onTap: () {}),
            const SizedBox(width: 12),
            _SocialIcon(icon: Icons.email, onTap: () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildLinksColumn(
    BuildContext context, {
    required String title,
    required List<_FooterLink> links,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                // Navigate using context from the widget tree
              },
              child: _FooterTextLink(link: link),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        _ContactItem(icon: Icons.location_on, text: 'Tanzania'),
        const SizedBox(height: 12),
        _ContactItem(icon: Icons.phone, text: '+255 000 000 000'),
        const SizedBox(height: 12),
        _ContactItem(icon: Icons.email, text: 'info@jermancompany.com'),
      ],
    );
  }
}

class _FooterLink {
  final String text;
  final String path;

  _FooterLink({required this.text, required this.path});
}

class _FooterTextLink extends StatefulWidget {
  final _FooterLink link;

  const _FooterTextLink({required this.link});

  @override
  State<_FooterTextLink> createState() => _FooterTextLinkState();
}

class _FooterTextLinkState extends State<_FooterTextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.link.path),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: _isHovered ? Colors.white : Colors.white60,
            fontSize: 14,
          ),
          child: Text(widget.link.text),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

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
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white54, size: 16),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.white60),
          ),
        ),
      ],
    );
  }
}

class _FooterBottomLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterBottomLink({required this.text, required this.onTap});

  @override
  State<_FooterBottomLink> createState() => _FooterBottomLinkState();
}

class _FooterBottomLinkState extends State<_FooterBottomLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: _isHovered ? Colors.white : Colors.white54,
          ),
        ),
      ),
    );
  }
}
