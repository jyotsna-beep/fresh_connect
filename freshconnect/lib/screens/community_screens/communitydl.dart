import 'package:flutter/material.dart';

class Communitydl extends StatelessWidget {
  // Sample data for registered flats
  final List<Map<String, String>> registeredFlats = [
    {'flatNumber': '106', 'ownerName': 'Anna Wilson', 'phone': '9871234560'},
    {'flatNumber': '107', 'ownerName': 'David Lee', 'phone': '9567890123'},
    {'flatNumber': '109', 'ownerName': 'Daniel Miller', 'phone': '9345678901'},
    // Add more flats as needed
  ];

  Communitydl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Monthly Defaulter List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
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
                        // Functionality when a flat is tapped
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Flat ${flat['flatNumber']} selected!')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kindly clear the monthly dues to avoid service interruptions and ensure smooth operations. Your cooperation is appreciated.',
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}