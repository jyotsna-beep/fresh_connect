import 'package:flutter/material.dart';

class VendorOrders extends StatefulWidget {
  const VendorOrders({super.key});

  @override
  State<VendorOrders> createState() => _VendorOrdersState();
}

class _VendorOrdersState extends State<VendorOrders> {
  final List<Map<String, String>> pendingOrders = [
    {
      'name': 'John Doe',
      'address': '123 Main St',
      'products': 'Tomatoes, Potatoes',
      'payment': 'Cash',
      'phone': '9876543210'
    },
    {
      'name': 'Jane Smith',
      'address': '456 Elm St',
      'products': 'Apples, Carrots',
      'payment': 'Paid',
      'phone': '9123456789'
    },
  ];

  final List<Map<String, String>> deliveredOrders = [
    {
      'name': 'Alice Johnson',
      'address': '789 Pine St',
      'products': 'Bananas, Onions',
      'payment': 'Paid',
      'phone': '9876012345'
    },
    {
      'name': 'Bob Brown',
      'address': '101 Maple St',
      'products': 'Milk, Bread',
      'payment': 'Cash',
      'phone': '9988776655'
    },
  ];

  bool showPending = true;

  // Controllers for input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _productsController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _addOrder() {
    String name = _nameController.text;
    String address = _addressController.text;
    String products = _productsController.text;
    String payment = _paymentController.text;
    String phone = _phoneController.text;

    if (name.isEmpty || address.isEmpty || products.isEmpty || payment.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() {
      if (showPending) {
        pendingOrders.add({
          'name': name,
          'address': address,
          'products': products,
          'payment': payment,
          'phone': phone,
        });
      } else {
        deliveredOrders.add({
          'name': name,
          'address': address,
          'products': products,
          'payment': payment,
          'phone': phone,
        });
      }
    });

    // Clear input fields and close the modal
    _nameController.clear();
    _addressController.clear();
    _productsController.clear();
    _paymentController.clear();
    _phoneController.clear();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Status',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Column(
        children: [
          // Toggle buttons
          Container(
            color: const Color.fromARGB(255, 26, 62, 27),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showPending = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showPending ? Colors.green : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Pending Orders',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showPending = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !showPending ? Colors.green : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Delivered Orders',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Order List
          Expanded(
            child: ListView.builder(
              itemCount: showPending ? pendingOrders.length : deliveredOrders.length,
              itemBuilder: (context, index) {
                final order = showPending ? pendingOrders[index] : deliveredOrders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    elevation: 4.0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        'Customer: ${order['name']}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text('Address: ${order['address']}'),
                          const SizedBox(height: 4),
                          Text('Products: ${order['products']}'),
                          const SizedBox(height: 4),
                          Text('Payment: ${order['payment']}'),
                          const SizedBox(height: 4),
                          Text('Phone: ${order['phone']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Customer Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _productsController,
                      decoration: InputDecoration(
                        labelText: 'Products',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _paymentController,
                      decoration: InputDecoration(
                        labelText: 'Payment Method',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _addOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text('Add Order'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
        child: const Icon(Icons.add),
      ),
    );
  }
}