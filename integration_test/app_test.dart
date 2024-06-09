import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:factory_mgmt2/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (WidgetTester tester) async {
      // Initialize the app
      app.main();
      await tester.pumpAndSettle();

      // Log the entire widget tree
      debugDumpApp();

      // Verify the presence of the TextFormField widgets
      var emailFields = find.byType(TextFormField);
      var passwordFields = find.byType(TextFormField);
      var loginButtons = find.byType(ElevatedButton);

      // Ensure the TextFormField and ElevatedButton widgets are found
      expect(emailFields, findsNWidgets(2));
      expect(loginButtons, findsOneWidget);

      // Log the found widgets for debugging
      print('Email fields found: ${tester.widgetList(emailFields).length}');
      print('Password fields found: ${tester.widgetList(passwordFields).length}');
      print('Login buttons found: ${tester.widgetList(loginButtons).length}');

      var emailField = emailFields.first;
      var passwordField = passwordFields.last;
      var loginButton = loginButtons.first;

      // Enter text for the email address
      await tester.enterText(emailField, 'flutterexp@gmail.com');
      await Future.delayed(const Duration(seconds: 1));

      // Enter text for the password
      await tester.enterText(passwordField, '123456');
      await Future.delayed(const Duration(seconds: 1));

      // Tap the login button
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      var firstCheckboxFinder = find.byType(Checkbox).first;

      // Verify the presence of the Checkbox widget
      expect(firstCheckboxFinder, findsOneWidget);

      // Check the initial state of the checkbox
      expect(
        tester.getSemantics(firstCheckboxFinder),
        matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: false,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );

      // Tap the checkbox to change its state
      await tester.tap(firstCheckboxFinder);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));

      // Verify the changed state of the checkbox
      expect(
        tester.getSemantics(firstCheckboxFinder),
        matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );
    });
  });
}
