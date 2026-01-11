// Basic Flutter widget test for JERMAN COMPANY website.

import 'package:flutter_test/flutter_test.dart';
import 'package:jerman_company_web/app.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the app title is present
    expect(find.text('JERMAN COMPANY'), findsWidgets);
  });
}
