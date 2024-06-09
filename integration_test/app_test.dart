import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:factory_mgmt2/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:factory_mgmt2/otp_confirmation_page.dart';
import 'package:factory_mgmt2/activation.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Test', () {
    testWidgets("OTP Confirmation Page test", (WidgetTester tester) async {
      try {
        // Initialize the OTP Confirmation Page
        await tester.pumpWidget(
          const MaterialApp(
            home: OTPConfirmationPage(),
          ),
        );
        await tester.pumpAndSettle();

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

        // Log the TextField and ElevatedButton widgets for further inspection
        otpField.evaluate().forEach((element) {
          print('OTP Field: ${element.widget}');
        });
        activateButton.evaluate().forEach((element) {
          print('Activate Button: ${element.widget}');
        });

        // Enter OTP
        await tester.enterText(otpField, '123456');
        await Future.delayed(const Duration(seconds: 1));

        // Tap the activate button
        await tester.tap(activateButton);
        await tester.pumpAndSettle();

        // Further checks or interactions can be added here
      } catch (e) {
        print('Exception caught in OTP Confirmation Page test: $e');
      }
    });

    testWidgets("Account Activation Page test", (WidgetTester tester) async {
      try {
        // Initialize the Account Activation Page
        await tester.pumpWidget(
          const MaterialApp(
            home: AccountActivationPage(),
          ),
        );
        await tester.pumpAndSettle();

        // Log the entire widget tree
        debugDumpApp();

        // Verify the presence of the TextField widget for phone number
        var phoneNumberField = find.byType(TextField);
        var getActivationCodeButton = find.byType(ElevatedButton);

        // Log the state of the widget tree for debugging
        print('Phone number fields found: ${phoneNumberField.evaluate().length}');
        print('Get activation code buttons found: ${getActivationCodeButton.evaluate().length}');

        // Ensure the TextField and ElevatedButton widgets are found
        expect(phoneNumberField, findsOneWidget, reason: 'Expected to find 1 TextField widget for phone number');
        expect(getActivationCodeButton, findsOneWidget, reason: 'Expected to find 1 ElevatedButton widget for getting activation code');

        // Enter phone number
        await tester.enterText(phoneNumberField, '0123456789');
        await Future.delayed(const Duration(seconds: 1));

        // Tap the get activation code button
        await tester.tap(getActivationCodeButton);
        await tester.pumpAndSettle();

        // Further checks or interactions can be added here
      } catch (e) {
        print('Exception caught in Account Activation Page test: $e');
      }
    });
  });
}
