import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Responsive top navigation bar with logo and navigation links.
/// Shows hamburger menu on mobile, full nav links on desktop.
class TopNav extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const TopNav({super.key, this.scaffoldKey});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    final currentPath = GoRouterState.of(context).uri.path;

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      leading: isSmallScreen
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => scaffoldKey?.currentState?.openDrawer(),
            )
          : null,
      automaticallyImplyLeading: false,
      title: InkWell(
        onTap: () => context.go('/'),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 40,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.business, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'JERMAN COMPANY',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: isSmallScreen
          ? null
          : [
              _NavButton(
                label: 'Home',
                path: '/',
                isActive: currentPath == '/',
              ),
              _NavButton(
                label: 'About',
                path: '/about',
                isActive: currentPath == '/about',
              ),
              _NavButton(
                label: 'Services',
                path: '/services',
                isActive: currentPath == '/services',
              ),
              _NavButton(
                label: 'Contact',
                path: '/contact',
                isActive: currentPath == '/contact',
              ),
              const SizedBox(width: 16),
            ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final String path;
  final bool isActive;

  const _NavButton({
    required this.label,
    required this.path,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// Navigation drawer for mobile screens.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.business,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'JERMAN COMPANY',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _DrawerItem(
              icon: Icons.home,
              label: 'Home',
              path: '/',
              isActive: currentPath == '/',
            ),
            _DrawerItem(
              icon: Icons.info,
              label: 'About',
              path: '/about',
              isActive: currentPath == '/about',
            ),
            _DrawerItem(
              icon: Icons.design_services,
              label: 'Services',
              path: '/services',
              isActive: currentPath == '/services',
            ),
            _DrawerItem(
              icon: Icons.contact_mail,
              label: 'Contact',
              path: '/contact',
              isActive: currentPath == '/contact',
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String path;
  final bool isActive;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.path,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Theme.of(context).colorScheme.primary : null,
        ),
      ),
      selected: isActive,
      selectedTileColor: Theme.of(
        context,
      ).colorScheme.primaryContainer.withOpacity(0.3),
      onTap: () {
        Navigator.of(context).pop();
        context.go(path);
      },
    );
  }
}
