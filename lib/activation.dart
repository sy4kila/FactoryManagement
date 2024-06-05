import 'package:flutter/material.dart';
import 'otp_confirmation_page.dart';

class AccountActivationPage extends StatefulWidget {
  const AccountActivationPage({super.key});

  @override
  _AccountActivationPageState createState() => _AccountActivationPageState();
}

class _AccountActivationPageState extends State<AccountActivationPage> {
  bool isAgreed = false;

  void _navigateToOtpPage() {
    if (isAgreed) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OTPConfirmationPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.05),
            Image.asset(
              'images/upm.png',
              width: screenSize.width * 0.4,
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: screenSize.width * 0.1,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenSize.height * 0.05),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
              padding: EdgeInsets.all(screenSize.width * 0.05),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(5, 5),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(-5, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Enter your mobile number to activate your account',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        color: Colors.black,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Information'),
                                content: const Text('Please enter your mobile number to receive the activation code.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Row(
                    children: [
                      Image.asset(
                        'images/malaysia.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '+60',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your phone number here',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Row(
                    children: [
                      Checkbox(
                        value: isAgreed,
                        onChanged: (value) {
                          setState(() {
                            isAgreed = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the terms & conditions',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Center(
                    child: ElevatedButton(
                      onPressed: isAgreed ? _navigateToOtpPage : null,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1, vertical: screenSize.height * 0.02),
                      ),
                      child: Text(
                        'Get Activation Code',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.05),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Privacy Statement'),
                      content: const Text('Your privacy statement here.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Disclaimer | Privacy Statement',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              'Copyright UPM & Kejuruteraan Minyak Sawit CCS Sdn. Bhd',
              style: TextStyle(
                fontSize: screenSize.width * 0.03,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}