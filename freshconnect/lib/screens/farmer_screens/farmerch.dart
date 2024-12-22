import 'package:flutter/material.dart';

class FarmerCH extends StatefulWidget {
  const FarmerCH({super.key});

  @override
  _FarmerCHState createState() => _FarmerCHState();
}

class _FarmerCHState extends State<FarmerCH> {
  final List<Map<String, dynamic>> _harvestedItems = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  void _addHarvestItem() {
    String name = _nameController.text;
    String quantity = _quantityController.text;

    // Determine the icon/image for the item
    String iconPath;
    switch (name.toLowerCase()) {
      case 'tomatoes':
        iconPath = 'assets/images/tomato.jpg';
        break;
      case 'potatoes':
        iconPath = 'assets/images/potato.jpg';
        break;
      case 'carrots':
        iconPath = 'assets/images/carrot.jpg';
        break;
      case 'cabbage':
        iconPath = 'assets/images/cabbage.jpg';
        break;
      case 'spinach':
        iconPath = 'assets/images/spinach.jpg';
        break;
      default:
        iconPath = 'assets/images/placeholder.jpg'; // A default placeholder image
    }

    // Add the new item to the list
    setState(() {
      _harvestedItems.add({
        'name': name,
        'quantity': '$quantity kg',
        'icon': iconPath,
      });
    });

    // Clear the input fields
    _nameController.clear();
    _quantityController.clear();
    Navigator.pop(context); // Close the modal bottom sheet
  }

  void _deleteHarvestItem(int index) {
    setState(() {
      _harvestedItems.removeAt(index); // Remove the item at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Monthly Harvest',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Column(
        children: [
          Expanded(
            child: _harvestedItems.isEmpty
                ? Center(
                    child: Text(
                      'No items added yet.\nTap the "+" button to add harvest items.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _harvestedItems.length,
                    itemBuilder: (context, index) {
                      final item = _harvestedItems[index];
                      return Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(item['icon']!),
                            backgroundColor: Colors.white,
                          ),
                          title: Text(
                            item['name']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 26, 62, 27),
                            ),
                          ),
                          subtitle: Text(
                            'Quantity: ${item['quantity']}',
                            style: const TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteHarvestItem(index), // Delete the item
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
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Harvest Name',
                      hintText: 'e.g., Tomatoes, Potatoes',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity (in kg)',
                      hintText: 'e.g., 100',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addHarvestItem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 26, 62, 27),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Add Harvest'),
                  ),
                ],
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
        child: const Icon(Icons.add),
      ),
    );
  }
}