import 'package:flutter/material.dart';

class VendorAdPage extends StatelessWidget {
  // Placeholder for vendor's data
  final String vendorName = "John Doe";
  final String contactDetails = "9876543210";
  final String address = "123, Green Street, Springfield";
  final String bankName = "XYZ Bank";
  final String accountNumber = "123456789012";
  final String ifscCode = "XYZB0001234";
  final double todaysTotalMoney = 1250.00;
  final double monthsTotalMoney = 37500.00;

  const VendorAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Details',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27), // Followed your theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Vendor Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            _buildInfoTile(
              title: "Name",
              value: vendorName,
              icon: Icons.person,
            ),
            _buildInfoTile(
              title: "Contact Details",
              value: contactDetails,
              icon: Icons.phone,
            ),
            _buildInfoTile(
              title: "Address",
              value: address,
              icon: Icons.location_on,
            ),
            const SizedBox(height: 20),
            const Text(
              'Earnings Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            _buildInfoTile(
              title: "Today's Total Money",
              value: "₹${todaysTotalMoney.toStringAsFixed(2)}",
              icon: Icons.monetization_on,
            ),
            _buildInfoTile(
              title: "Month's Total Money",
              value: "₹${monthsTotalMoney.toStringAsFixed(2)}",
              icon: Icons.bar_chart,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bank Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            _buildInfoTile(
              title: "Bank Name",
              value: bankName,
              icon: Icons.account_balance,
            ),
            _buildInfoTile(
              title: "Account Number",
              value: accountNumber,
              icon: Icons.account_balance_wallet,
            ),
            _buildInfoTile(
              title: "IFSC Code",
              value: ifscCode,
              icon: Icons.code,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build information tiles
  Widget _buildInfoTile({required String title, required String value, required IconData icon}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade700, // Green color following theme
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
