import 'package:flutter/material.dart';
import 'package:freshconnect/screens/farmer_screens/farmerbws.dart';
import 'package:freshconnect/screens/farmer_screens/farmercd.dart';
import 'package:freshconnect/screens/farmer_screens/farmercl.dart';
import 'package:freshconnect/screens/farmer_screens/farmerch.dart';

class Farmers1 extends StatefulWidget {
  const Farmers1({super.key});

  @override
  State<Farmers1> createState() => _Farmers1State();
}

class _Farmers1State extends State<Farmers1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Farmer Dashboard',
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
              icon: Icons.recycling,
              title: 'Sell Biowaste',
              color: Colors.green.shade700,
              onTap: () {
                // Navigate to the Sell Biowaste Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmerBWS()));
              },
            ),
            _buildBox(
              icon: Icons.checklist,
              title: 'Checklist',
              color: Colors.blue.shade700,
              onTap: () {
                // Navigate to the Checklist Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmerCL()));
              },
            ),
            _buildBox(
              icon: Icons.people_alt,
              title: 'Community Details',
              color: Colors.orange.shade700,
              onTap: () {
                // Navigate to the Community Details Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmerCD()));
              },
            ),
            _buildBox(
              icon: Icons.inventory,
              title: 'Current Harvest',
              color: Colors.purple.shade700,
              onTap: () {
                // Navigate to the Current Harvest Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FarmerCH()));
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