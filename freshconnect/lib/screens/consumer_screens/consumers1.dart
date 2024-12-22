import 'package:flutter/material.dart';
import 'package:freshconnect/screens/consumer_screens/consumerad.dart';
import 'package:freshconnect/screens/consumer_screens/nearby_vendors.dart';

class Consumers1 extends StatefulWidget {
  const Consumers1({super.key});

  @override
  State<Consumers1> createState() => _Consumers1State();
}

class _Consumers1State extends State<Consumers1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consumer Dashboard',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Two boxes per row
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildBox(
              icon: Icons.location_city,
              title: 'Nearby Vendors',
              color: Colors.green.shade700,
              onTap: () {
                // Navigate to the Sell Biowaste Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => NearbyVendors()));
              },
            ),
            _buildBox(
              icon: Icons.details,
              title: 'Account Details',
              color: Colors.orange.shade700,
              onTap: () {
                // Navigate to the Community Details Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ConsumerAdPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each box
  Widget _buildBox({required IconData icon, required String title, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}