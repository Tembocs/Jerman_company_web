import 'package:flutter/material.dart';
import '../widgets/site_scaffold.dart';
import '../widgets/hero_section.dart';
import '../widgets/stats_section.dart';
import '../widgets/services_section.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_section.dart';

/// Home page with all sections.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteScaffold(
      child: Column(
        children: [
          HeroSection(),
          StatsSection(),
          ServicesSection(),
          WhyChooseUsSection(),
          TestimonialsSection(),
          ContactSection(),
        ],
      ),
    );
  }
}
