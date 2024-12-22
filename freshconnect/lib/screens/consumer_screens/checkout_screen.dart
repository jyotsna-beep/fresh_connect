import 'package:flutter/material.dart';
import 'payment_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalPrice;

  const CheckoutScreen({required this.totalPrice, super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Enter your address'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (addressController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter your address.')),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(totalPrice: totalPrice),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}