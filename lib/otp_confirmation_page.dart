import 'package:flutter/material.dart';
import 'activation.dart';
import 'main.dart';

class OTPConfirmationPage extends StatefulWidget {
  const OTPConfirmationPage({super.key});

  @override
  _OTPConfirmationPageState createState() => _OTPConfirmationPageState();
}

class _OTPConfirmationPageState extends State<OTPConfirmationPage> {
  int attemptCount = 0;

  void _resetOtp() {
    setState(() {
      attemptCount++;
      if (attemptCount >= 6) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AccountActivationPage()),
        );
      }
    });
  }

  void _activate() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
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
                          'Enter the activation code you received via SMS.',
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
                                content: const Text('Please enter the OTP code sent to your mobile number.'),
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
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter OTP',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$attemptCount/6',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t receive?',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: _resetOtp,
                        child: Text(
                          'Tap here',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.045,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.05),
                  Center(
                    child: ElevatedButton(
                      onPressed: _activate,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1, vertical: screenSize.height * 0.02),
                      ),
                      child: Text(
                        'Activate',
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
