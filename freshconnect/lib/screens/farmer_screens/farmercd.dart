import 'package:flutter/material.dart';

class FarmerCD extends StatelessWidget {
  const FarmerCD({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample community data
    final List<Map<String, String>> communities = [
      {
        'name': 'Green Valley Gated Community',
        'address': '123 Green Street, Eco City',
        'contact': '+91 9876543210',
        'harvest': '250 kg of produce per month',
        'salary': '₹15,000 per month',
      },
      {
        'name': 'FreshBites Restaurant',
        'address': '45 Foodie Lane, Gourmet Town',
        'contact': '+91 9876541234',
        'harvest': '300 kg of vegetables per month',
        'salary': '₹20,000 per month',
      },
      {
        'name': 'Sunshine Apartments',
        'address': '78 Sunrise Avenue, Nature City',
        'contact': '+91 9876546789',
        'harvest': '200 kg of produce per month',
        'salary': '₹12,000 per month',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Community Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: communities.length,
          itemBuilder: (context, index) {
            final community = communities[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      community['name']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 26, 62, 27),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            community['address']!,
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          community['contact']!,
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.shopping_basket, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Harvest: ${community['harvest']}',
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.attach_money, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          'Salary: ${community['salary']}',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}