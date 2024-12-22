import 'package:flutter/material.dart';


class OrderConfirmationScreen extends StatelessWidget {
  final double totalPrice;

  const OrderConfirmationScreen({required this.totalPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Order Confirmed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}