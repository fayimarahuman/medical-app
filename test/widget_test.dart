// test/widget_test.dart
// ✅ Widget test to ensure app builds successfully

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/main.dart'; // Make sure this matches pubspec.yaml

void main() {
  testWidgets('App builds and displays splash/logo', (WidgetTester tester) async {
    // Build (render) the main app widget
    await tester.pumpWidget(const MedicalApp());

    // Wait for splash screen animations (if any)
    await tester.pumpAndSettle();

    // Check that the logo image is present
    expect(find.byType(Image), findsWidgets);

    // Optionally, check for a specific asset path
    expect(find.byWidgetPredicate(
      (widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == 'assets/logo.jpg',
    ), findsOneWidget);
  });
}
