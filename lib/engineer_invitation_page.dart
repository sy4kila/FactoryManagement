import 'package:flutter/material.dart';

class EngineerInvitationPage extends StatelessWidget {
  EngineerInvitationPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _submit(BuildContext context) {
    // Add the submitted information to the list of engineers
    String name = _nameController.text;
    String phone = _phoneController.text;

    // Check if fields are not empty
    if (name.isNotEmpty && phone.isNotEmpty) {
      Navigator.pop(context, {'name': name, 'phone': phone});
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invitation'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.grey[300], // Light grey background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Invitation',
              style: TextStyle(
                fontSize: screenSize.width * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Invite Users',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Owner\'s Name',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8), // Vertical gap between label and input field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Type your name', // Placeholder text
              ),
            ),
            const SizedBox(height: 20), // Vertical gap between input fields
            Text(
              'Owner\'s Phone Number',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8), // Vertical gap between label and input field
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
                    fontSize: screenSize.width * 0.05,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8), // Gap between +60 and the input field
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter your phone number', // Placeholder text
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Vertical gap before submit button
            ElevatedButton(
              onPressed: () => _submit(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.red[100], // Text color black
                padding: const EdgeInsets.symmetric(vertical: 16.0), // Increase button height
              ).copyWith(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.grey[300]; // Light grey when pressed
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: screenSize.width * 0.05), // Increase font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}