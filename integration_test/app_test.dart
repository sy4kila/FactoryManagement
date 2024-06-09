import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:factory_mgmt2/otp_confirmation_page.dart';
import 'package:factory_mgmt2/activation.dart';
import 'package:factory_mgmt2/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Test', () {
    testWidgets("Account Activation Page test", (WidgetTester tester) async {
      // Initialize the Account Activation Page
      await tester.pumpWidget(
        const MaterialApp(
          home: AccountActivationPage(),
        ),
      );
      await tester.pumpAndSettle();
      print('Initialized AccountActivationPage.');

      // Verify the presence of the TextField widget for phone number
      var phoneNumberField = find.byType(TextField);
      var getActivationCodeButton = find.byType(ElevatedButton);
      var agreeCheckbox = find.byType(Checkbox);

      // Ensure the TextField, Checkbox, and ElevatedButton widgets are found
      expect(phoneNumberField, findsOneWidget, reason: 'Expected to find 1 TextField widget for phone number');
      expect(agreeCheckbox, findsOneWidget, reason: 'Expected to find 1 Checkbox widget for agreement');
      expect(getActivationCodeButton, findsOneWidget, reason: 'Expected to find 1 ElevatedButton widget for getting activation code');

      // Enter phone number
      print('Entering phone number...');
      await tester.enterText(phoneNumberField, '0123456789');
      await Future.delayed(const Duration(seconds: 1));
      print('Entered phone number.');

      // Check the agreement checkbox
      print('Checking agreement checkbox...');
      await tester.tap(agreeCheckbox);
      await tester.pumpAndSettle();
      print('Checked agreement checkbox.');

      // Tap the get activation code button
      print('Tapping Get Activation Code button...');
      await tester.tap(getActivationCodeButton);
      await tester.pumpAndSettle();
      print('Tapped Get Activation Code button.');

      // Verify navigation to OTPConfirmationPage
      expect(find.byType(OTPConfirmationPage), findsOneWidget, reason: 'Expected to navigate to OTPConfirmationPage');
    });

    testWidgets("OTP Confirmation Page test", (WidgetTester tester) async {
      // Initialize the OTP Confirmation Page
      await tester.pumpWidget(
        const MaterialApp(
          home: OTPConfirmationPage(),
        ),
      );
      await tester.pumpAndSettle();
      print('Initialized OTPConfirmationPage.');

      // Verify the presence of the TextField widget for OTP
      var otpField = find.byType(TextField);
      var activateButton = find.byType(ElevatedButton);

      // Ensure the TextField and ElevatedButton widgets are found
      expect(otpField, findsOneWidget, reason: 'Expected to find 1 TextField widget for OTP');
      expect(activateButton, findsOneWidget, reason: 'Expected to find 1 ElevatedButton widget for activation');

      // Enter OTP
      print('Entering OTP...');
      await tester.enterText(otpField, '123456');
      await Future.delayed(const Duration(seconds: 1));
      print('Entered OTP.');

      // Tap the activate button
      print('Tapping Activate button...');
      await tester.tap(activateButton);
      await tester.pumpAndSettle();
      print('Tapped Activate button.');

      // Verify navigation to MyHomePage
      expect(find.byType(MyHomePage), findsOneWidget, reason: 'Expected to navigate to MyHomePage');
    });
  });
}
