import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String role;

  const Dashboard({super.key, required this.role}); // Accept the role in the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Dashboard'),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Center(
        child: Text('Welcome to the $role Dashboard!', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}