import 'package:flutter/material.dart';
import 'package:freshconnect/screens/community_screens/communitydcl.dart';
import 'package:freshconnect/screens/community_screens/communitydl.dart';
import 'package:freshconnect/screens/community_screens/communityrf.dart';
import 'package:freshconnect/screens/community_screens/communitytp.dart';

class Communitys1 extends StatefulWidget {
  const Communitys1({super.key});

  @override
  State<Communitys1> createState() => _Communitys1State();
}

class _Communitys1State extends State<Communitys1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Greendale Apartments',
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
              icon: Icons.app_registration_rounded,
              title: 'Registered flats',
              color: Colors.green.shade700,
              onTap: () {
                // Navigate to the Sell Biowaste Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityRF()));
              },
            ),
            _buildBox(
              icon: Icons.checklist,
              title: "Today's Delivery checklist",
              color: Colors.blue.shade700,
              onTap: () {
                // Navigate to the Checklist Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => Communitydcl()));
              },
            ),
            _buildBox(
              icon: Icons.timelapse,
              title: 'Monthly Defaulter list',
              color: Colors.orange.shade700,
              onTap: () {
                // Navigate to the Community Details Page
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Communitydl()));
              },
            ),
            _buildBox(
              icon: Icons.price_change,
              title: "Today's Prices",
              color: Colors.purple.shade700,
              onTap: () {
                // Navigate to the Current Harvest Page
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Communitytp()));
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
          boxShadow: [
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
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
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