import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedFactory = 1;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Factory $selectedFactory'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: screenSize.height * 0.02), // Gap between AppBar and frame
          Container(
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
            child: Column(
              children: [
                if (selectedFactory == 1)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.red,
                          size: screenSize.width * 0.06,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'ABD1234 IS UNREACHABLE!',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' ${_getPowerConsumption(selectedFactory)} kW',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(
                  height: screenSize.height * 0.48, // Adjusted height
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1 / 1.1, // Adjusted aspect ratio to make all boxes same size
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Light grey color
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            _getImageForFactory(selectedFactory, index),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  child: Text(
                    selectedFactory == 1 ? '--:--' : _getTimestamp(selectedFactory),
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenSize.height * 0.02), // Gap between frame and buttons
          Expanded(
            child: Container(
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
                              'images/factorylogo.png', // Ensure this is a transparent PNG image
                              width: 40, // Adjusted size for the logo
                              height: 40, // Adjusted size for the logo
                              color: Colors.black, // Ensuring the logo is black
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Factory $factoryNumber',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.04,
                                color: Colors.black, // Changed text color to black
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
          ),
          SizedBox(height: screenSize.height * 0.02), // Gap between buttons and navigation bar
        ],
      ),
    );
  }

  String _getImageForFactory(int factoryNumber, int index) {
    switch (factoryNumber) {
      case 1:
        return [
          'images/powerfrequencyf1.png',
          'images/steamflowf1.png',
          'images/steampressuref1.png',
          'images/waterlevelf1.png',
        ][index];
      case 2:
        return [
          'images/powerfrequencyf2.png',
          'images/steamflowf2.png',
          'images/steampressuref2.png',
          'images/waterlevelf2.png',
        ][index];
      default:
        return '';
    }
  }

  String _getPowerConsumption(int factoryNumber) {
    switch (factoryNumber) {
      case 1:
        return '1549.7';
      case 2:
        return '1240.3';
      default:
        return '0';
    }
  }

  String _getTimestamp(int factoryNumber) {
    switch (factoryNumber) {
      case 1:
        return '--:--';
      case 2:
        return '2024-05-01 14:00:00';
      default:
        return 'N/A';
    }
  }
}
