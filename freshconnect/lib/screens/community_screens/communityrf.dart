import 'package:flutter/material.dart';

class CommunityRF extends StatelessWidget {
  // Sample data for 10 registered flats
  final List<Map<String, String>> registeredFlats = [
    {'flatNumber': '101', 'ownerName': 'John Doe', 'phone': '9876543210'},
    {'flatNumber': '102', 'ownerName': 'Jane Smith', 'phone': '9123456789'},
    {'flatNumber': '103', 'ownerName': 'Michael Brown', 'phone': '9988776655'},
    {'flatNumber': '104', 'ownerName': 'Emily Davis', 'phone': '9012345678'},
    {'flatNumber': '105', 'ownerName': 'Chris Johnson', 'phone': '9234567890'},
    {'flatNumber': '106', 'ownerName': 'Anna Wilson', 'phone': '9871234560'},
    {'flatNumber': '107', 'ownerName': 'David Lee', 'phone': '9567890123'},
    {'flatNumber': '108', 'ownerName': 'Sophia White', 'phone': '9456789012'},
    {'flatNumber': '109', 'ownerName': 'Daniel Miller', 'phone': '9345678901'},
    {'flatNumber': '110', 'ownerName': 'Olivia Taylor', 'phone': '9123450987'},
  ];

  CommunityRF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registered Flats',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: registeredFlats.length,
        itemBuilder: (context, index) {
          final flat = registeredFlats[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Flat Number: ${flat['flatNumber']}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text('Owner: ${flat['ownerName']}', style: const TextStyle(fontSize: 16)),
                  Text('Phone: ${flat['phone']}', style: const TextStyle(fontSize: 16)),
                ],
              ),
              leading: const Icon(Icons.home, size: 40, color: Colors.green),
              onTap: () {
                // You can add functionality here when a flat is tapped
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Flat ${flat['flatNumber']} selected!')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}