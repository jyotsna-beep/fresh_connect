import 'package:flutter/material.dart';
import 'cart_screen.dart';

class VendorStore extends StatefulWidget {
  final int vendorId;

  const VendorStore({required this.vendorId, super.key});

  @override
  _VendorStoreState createState() => _VendorStoreState();
}

class _VendorStoreState extends State<VendorStore> {
  // Example products for the vendor
  final List<Map<String, dynamic>> products = [
    {'name': 'Tomatoes', 'price': 1.5, 'image': 'assets/images/tomato.jpg', 'quantity': 0},
    {'name': 'Potatoes', 'price': 2.0, 'image': 'assets/images/potato.jpg', 'quantity': 0},
    {'name': 'Carrots', 'price': 1.2, 'image': 'assets/images/carrot.jpg', 'quantity': 0},
  ];

  void updateQuantity(int index, int change) {
    setState(() {
      products[index]['quantity'] = (products[index]['quantity'] + change).clamp(0, 100);
    });
  }

  void goToCart() {
    List<Map<String, dynamic>> cartItems = products.where((item) => item['quantity'] > 0).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(cartItems: cartItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vendor Store',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: goToCart,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(product['image'], height: 75, width: 75, fit: BoxFit.cover),
                Text(product['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('\$${product['price']}', style: const TextStyle(fontSize: 16, color: Colors.green)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => updateQuantity(index, -1),
                    ),
                    Text('${product['quantity']}'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => updateQuantity(index, 1),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}