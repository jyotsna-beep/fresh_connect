import 'package:flutter/material.dart';
import 'vendor_store.dart';

class NearbyVendors extends StatelessWidget {
  final List<Map<String, dynamic>> vendors = [
    {'name': 'GreenFresh Vendor', 'id': 1},
    {'name': 'Daily Harvest', 'id': 2},
    {'name': 'Farm to Fork', 'id': 3},
  ];

   NearbyVendors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nearby Vendors',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: ListView.builder(
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vendors[index]['name']),
            leading: const Icon(Icons.store, size: 40, color: Colors.green),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VendorStore(vendorId: vendors[index]['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}