import 'package:flutter/material.dart';

class Communitytp extends StatelessWidget {
  // Sample data for today's vegetable prices
  final List<Map<String, dynamic>> vegetablePrices = [
    {'name': 'Tomato', 'image': 'assets/images/tomato.jpg', 'price': '₹40/kg'},
    {'name': 'Potato', 'image': 'assets/images/potato.jpg', 'price': '₹30/kg'},
    {'name': 'Spinach', 'image': 'assets/images/spinach.jpg', 'price': '₹25/kg'},
    {'name': 'Cabbage', 'image': 'assets/images/cabbage.png', 'price': '₹35/kg'},
    {'name': 'Carrot', 'image': 'assets/images/carrot.png', 'price': '₹50/kg'},
  ];

  Communitytp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Vegetable Prices",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 3 / 4, // Aspect ratio for the cards
          ),
          itemCount: vegetablePrices.length,
          itemBuilder: (context, index) {
            final vegetable = vegetablePrices[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                      child: Image.asset(
                        vegetable['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vegetable['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            vegetable['price'],
                            style: const TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}