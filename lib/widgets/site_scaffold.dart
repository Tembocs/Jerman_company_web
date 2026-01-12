import 'package:flutter/material.dart';
import 'top_nav.dart';
import 'footer.dart';

/// Shared scaffold wrapper that provides consistent layout across all pages.
/// Includes responsive navigation bar, footer, and scroll-to-top button.
class SiteScaffold extends StatefulWidget {
  final Widget child;

  const SiteScaffold({super.key, required this.child});

  @override
  State<SiteScaffold> createState() => _SiteScaffoldState();
}

class _SiteScaffoldState extends State<SiteScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final showButton = _scrollController.offset > 400;
    if (showButton != _showScrollToTop) {
      setState(() => _showScrollToTop = showButton);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      key: _scaffoldKey,
      appBar: TopNav(scaffoldKey: _scaffoldKey),
      drawer: isSmallScreen ? const NavDrawer() : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [widget.child, const Footer()]),
          ),
          // Scroll to top button
          Positioned(
            bottom: 24,
            right: 24,
            child: AnimatedOpacity(
              opacity: _showScrollToTop ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AnimatedSlide(
                offset: _showScrollToTop ? Offset.zero : const Offset(0, 1),
                duration: const Duration(milliseconds: 200),
                child: _ScrollToTopButton(onPressed: _scrollToTop),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollToTopButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _ScrollToTopButton({required this.onPressed});

  @override
  State<_ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<_ScrollToTopButton> {
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
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(_isHovered ? 0.4 : 0.3),
                blurRadius: _isHovered ? 20 : 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -2))
              : Matrix4.identity(),
          child: const Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
