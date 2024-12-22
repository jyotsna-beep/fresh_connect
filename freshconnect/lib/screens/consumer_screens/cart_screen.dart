import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({required this.cartItems, super.key});

  double getTotalPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Your cart is empty!', style: TextStyle(fontSize: 18, color: Colors.grey)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.asset(item['image'], width: 50, height: 50),
                        title: Text(item['name']),
                        subtitle: Text('Quantity: ${item['quantity']}'),
                        trailing: Text('\$${(item['price'] * item['quantity']).toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(totalPrice: getTotalPrice()),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: Text('Proceed to Checkout (\$${getTotalPrice().toStringAsFixed(2)})'),
                  ),
                ),
              ],
            ),
    );
  }
}