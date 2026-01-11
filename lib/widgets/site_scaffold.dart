import 'package:flutter/material.dart';
import 'top_nav.dart';
import 'footer.dart';

/// Shared scaffold wrapper that provides consistent layout across all pages.
/// Includes responsive navigation bar and footer.
class SiteScaffold extends StatefulWidget {
  final Widget child;

  const SiteScaffold({super.key, required this.child});

  @override
  State<SiteScaffold> createState() => _SiteScaffoldState();
}

class _SiteScaffoldState extends State<SiteScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      key: _scaffoldKey,
      appBar: TopNav(scaffoldKey: _scaffoldKey),
      drawer: isSmallScreen ? const NavDrawer() : null,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [widget.child, const Footer()]),
            ),
          ),
        ],
      ),
    );
  }
}
