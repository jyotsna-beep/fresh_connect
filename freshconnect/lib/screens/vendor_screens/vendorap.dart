import 'package:flutter/material.dart';

class VendorAddProductPage extends StatefulWidget {
  const VendorAddProductPage({super.key});

  @override
  _VendorAddProductPageState createState() => _VendorAddProductPageState();
}

class _VendorAddProductPageState extends State<VendorAddProductPage> {
  List<Map<String, String>> products = []; // To store product details

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // Method to add a product
  void addProduct() {
    if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
      setState(() {
        products.add({
          'name': nameController.text,
          'price': priceController.text,
        });
        nameController.clear();
        priceController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  // Method to remove a product
  void removeProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product removed successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Products',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
        onPressed: addProduct,
        child: const Icon(Icons.add, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add a New Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price per kg',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Products List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Divider(),
            Expanded(
              child: products.isEmpty
                  ? const Center(
                      child: Text(
                        'No products added yet.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(Icons.shopping_cart, color: Colors.white),
                            ),
                            title: Text(
                              product['name']!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '₹${product['price']} per kg',
                              style: const TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeProduct(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
