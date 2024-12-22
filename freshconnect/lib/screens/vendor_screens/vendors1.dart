import 'package:flutter/material.dart';
import 'package:freshconnect/screens/vendor_screens/vendoros.dart';
import 'package:freshconnect/screens/vendor_screens/vendorap.dart';
import 'package:freshconnect/screens/vendor_screens/vendorad.dart';
class Vendors1 extends StatefulWidget {
  const Vendors1({super.key});

  @override
  State<Vendors1> createState() => _Vendors1State();
}

class _Vendors1State extends State<Vendors1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vendor Dashboard',
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
              icon: Icons.add_box,
              title: 'Add Products',
              color: Colors.green.shade700,
              onTap: () {
                // Navigate to Add Products Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VendorAddProductPage()),
                );
              },
            ),
            _buildBox(
              icon: Icons.track_changes,
              title: 'Order Status',
              color: Colors.blue.shade700,
              onTap: () {
                // Navigate to Order Status Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VendorOrders()),
                );
              },
            ),
            _buildBox(
              icon: Icons.account_circle,
              title: 'Account Details',
              color: Colors.orange.shade700,
              onTap: () {
                // Navigate to Account Details Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VendorAdPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each grid box
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

// Placeholder pages for navigation
class AddProductsPage extends StatelessWidget {
  const AddProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Products')),
      body: const Center(child: Text('Add Products Page')),
    );
  }
}

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Status')),
      body: const Center(child: Text('Order Status Page')),
    );
  }
}

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Details')),
      body: const Center(child: Text('Account Details Page')),
    );
  }
}
