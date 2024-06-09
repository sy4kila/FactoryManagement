import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:factory_mgmt2/otp_confirmation_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('OTP Confirmation Page Test', () {
    testWidgets("Check presence of widgets", (WidgetTester tester) async {
      // Initialize the OTP Confirmation Page
      await tester.pumpWidget(
        const MaterialApp(
          home: OTPConfirmationPage(),
        ),
      );
      await tester.pumpAndSettle();
      print('Initialized OTPConfirmationPage.');

      // Log the entire widget tree
      debugDumpApp();

      // Verify the presence of the TextField widget for OTP
      var otpField = find.byType(TextField);
      var activateButton = find.byType(ElevatedButton);

      // Log the state of the widget tree for debugging
      print('OTP fields found: ${otpField.evaluate().length}');
      print('Activate buttons found: ${activateButton.evaluate().length}');

      // Ensure the TextField and ElevatedButton widgets are found
      expect(otpField, findsOneWidget, reason: 'Expected to find 1 TextField widget for OTP');
      expect(activateButton, findsOneWidget, reason: 'Expected to find 1 ElevatedButton widget for activation');
    });
  });
}
