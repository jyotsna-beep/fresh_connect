import 'package:flutter/material.dart';

class FarmerCL extends StatefulWidget {
  const FarmerCL({super.key});

  @override
  State<FarmerCL> createState() => _FarmerCLState();
}

class _FarmerCLState extends State<FarmerCL> {
  // List of checklist items
  final List<Map<String, dynamic>> _checklist = List.generate(
    3, // Generates 15 checklist items
    (index) => {
      'task': 'Task ${index + 1}: Deliver produce to Community ${index + 1}',
      'isChecked': false,
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Farmer Checklist',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: _checklist.length,
          itemBuilder: (context, index) {
            final item = _checklist[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Checkbox(
                  value: item['isChecked'],
                  activeColor: const Color.fromARGB(255, 26, 62, 27),
                  onChanged: (bool? value) {
                    setState(() {
                      item['isChecked'] = value!;
                    });
                  },
                ),
                title: Text(
                  item['task'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: item['isChecked'] ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                trailing: Icon(
                  item['isChecked'] ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: item['isChecked'] ? Colors.green : Colors.grey,
                  size: 28,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}