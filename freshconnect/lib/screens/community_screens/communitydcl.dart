import 'package:flutter/material.dart';

class Communitydcl extends StatefulWidget {
  const Communitydcl({Key? key}) : super(key: key);

  @override
  State<Communitydcl> createState() => _CommunitydclState();
}

class _CommunitydclState extends State<Communitydcl> {
  // Sample data for today's delivery checklist
  final List<Map<String, dynamic>> deliveryChecklist = [
    {
      'flatNumber': '101',
      'ownerName': 'John Doe',
      'items': [
        {'name': 'Tomatoes', 'image': 'assets/tomatoes.png', 'quantity': '2 kg'},
        {'name': 'Potatoes', 'image': 'assets/potatoes.png', 'quantity': '3 kg'},
      ],
    },
    {
      'flatNumber': '102',
      'ownerName': 'Sarah Smith',
      'items': [
        {'name': 'Onions', 'image': 'assets/onions.png', 'quantity': '1.5 kg'},
        {'name': 'Carrots', 'image': 'assets/carrots.png', 'quantity': '2 kg'},
      ],
    },
    {
      'flatNumber': '201',
      'ownerName': 'Emily Davis',
      'items': [
        {'name': 'Capsicum', 'image': 'assets/capsicum.png', 'quantity': '1 kg'},
        {'name': 'Spinach', 'image': 'assets/spinach.png', 'quantity': '0.5 kg'},
      ],
    },
    {
      'flatNumber': '202',
      'ownerName': 'Michael Brown',
      'items': [
        {'name': 'Cauliflower', 'image': 'assets/cauliflower.png', 'quantity': '1 kg'},
        {'name': 'Brinjal', 'image': 'assets/brinjal.png', 'quantity': '1.5 kg'},
      ],
    },
    {
      'flatNumber': '301',
      'ownerName': 'Olivia Johnson',
      'items': [
        {'name': 'Cabbage', 'image': 'assets/cabbage.png', 'quantity': '2 kg'},
        {'name': 'Pumpkin', 'image': 'assets/pumpkin.png', 'quantity': '3 kg'},
      ],
    },
  ];

  // Track whether each flat's delivery is completed
  final Map<String, bool> deliveryStatus = {};

  @override
  void initState() {
    super.initState();
    // Initialize all delivery statuses as false
    for (var delivery in deliveryChecklist) {
      deliveryStatus[delivery['flatNumber']] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Delivery Checklist",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: deliveryChecklist.length,
          itemBuilder: (context, index) {
            final delivery = deliveryChecklist[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                title: Row(
                  children: [
                    const Icon(Icons.home, color: Colors.green, size: 30),
                    const SizedBox(width: 10),
                    Text(
                      'Flat ${delivery['flatNumber']} - ${delivery['ownerName']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                children: [
                  Column(
                    children: delivery['items'].map<Widget>((item) {
                      return ListTile(
                        leading: Image.asset(
                          item['image'],
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          item['name'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Quantity: ${item['quantity']}'),
                      );
                    }).toList(),
                  ),
                  CheckboxListTile(
                    title: const Text('Mark as Delivered'),
                    value: deliveryStatus[delivery['flatNumber']],
                    onChanged: (value) {
                      setState(() {
                        deliveryStatus[delivery['flatNumber']] = value!;
                      });
                      if (value!) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Delivery marked as completed for Flat ${delivery['flatNumber']}')),
                        );
                      }
                    },
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