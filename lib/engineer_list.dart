import 'package:flutter/material.dart';
import 'engineer_invitation_page.dart';

class EngineerListPage extends StatefulWidget {
  const EngineerListPage({super.key});

  @override
  _EngineerListPageState createState() => _EngineerListPageState();
}

class _EngineerListPageState extends State<EngineerListPage> {
  int selectedFactory = 1;
  List<Map<String, String>> engineers = [
    {'name': 'Engineer 1', 'phone': 'engineer1@factory1.com'},
    {'name': 'Engineer 2', 'phone': 'engineer2@factory1.com'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Engineers - Factory $selectedFactory'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: screenSize.height * 0.02),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
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
              child: selectedFactory == 1 ? _buildEngineerList(screenSize) : _navigateToInvitationPage(),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(2, (index) {
                int factoryNumber = index + 1;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFactory = factoryNumber;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: selectedFactory == factoryNumber
                            ? Colors.red[100]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(5, 5),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(-5, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/factorylogo.png',
                            width: 40,
                            height: 40,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Factory $factoryNumber',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
        ],
      ),
    );
  }

  Widget _buildEngineerList(Size screenSize) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: engineers.length,
            itemBuilder: (context, index) {
              return _buildEngineerTile(engineers[index]['name']!, engineers[index]['phone']!);
            },
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EngineerInvitationPage()),
            );
            if (result != null) {
              setState(() {
                engineers.add({
                  'name': result['name'],
                  'phone': result['phone'],
                });
              });
            }
          },
          child: const Text('Add Engineer'),
        ),
      ],
    );
  }

  Widget _buildEngineerTile(String name, String phone) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(-5, -5),
          ),
        ],
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(phone),
      ),
    );
  }

  Widget _navigateToInvitationPage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EngineerInvitationPage()),
      ).then((result) {
        if (result != null) {
          setState(() {
            engineers.add({
              'name': result['name'],
              'phone': result['phone'],
            });
          });
        }
        // Reset to Factory 1 when returning
        setState(() {
          selectedFactory = 1;
        });
      });
    });
    return Container(); // Return empty container while navigating
  }
}