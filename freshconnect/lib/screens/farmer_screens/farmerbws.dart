import 'package:flutter/material.dart';

class FarmerBWS extends StatefulWidget {
  const FarmerBWS({super.key});

  @override
  State<FarmerBWS> createState() => _FarmerBWSState();
}

class _FarmerBWSState extends State<FarmerBWS> {
  final TextEditingController _bioWasteTypeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  double _totalAmount = 0.0;

  // Function to calculate the amount
  void _calculateAmount() {
    final double quantity = double.tryParse(_quantityController.text) ?? 0.0;
    setState(() {
      _totalAmount = quantity * 50; // 1 kg = ₹50
    });
  }

  @override
  void dispose() {
    _bioWasteTypeController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  // Function to show receipt popup
  void _showReceipt() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Receipt',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Transaction Successful!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 10),
              const Text(
                'Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Bio Waste Type: ${_bioWasteTypeController.text}'),
              Text('Quantity: ${_quantityController.text} KGs'),
              Text('Total Amount: ₹$_totalAmount'),
              const SizedBox(height: 10),
              const Text(
                'Amount has been credited to your account.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              const Text(
                'Thank you for using FreshConnect!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close receipt dialog
                Navigator.pop(context); // Return to the previous screen
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sell Bio Waste',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Image
            Center(
              child: Image.asset(
                'assets/images/biowaste.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Bio Waste Type Input
            const Text(
              'Type of Bio Waste',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _bioWasteTypeController,
              decoration: InputDecoration(
                hintText: 'Enter the type of bio waste (e.g., Vegetable Peels)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Quantity Input
            const Text(
              'Quantity (in KGs)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the quantity in KGs',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => _calculateAmount(),
            ),
            const SizedBox(height: 20),

            // Total Amount Display
            const Text(
              'Total Amount (₹):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green.shade700, width: 2),
              ),
              child: Text(
                '₹$_totalAmount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green.shade800),
              ),
            ),
            const SizedBox(height: 30),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Show receipt only if all fields are filled
                  if (_bioWasteTypeController.text.isNotEmpty && _quantityController.text.isNotEmpty) {
                    _showReceipt();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all the fields!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 62, 27),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}