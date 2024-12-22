import 'package:flutter/material.dart';
import 'package:freshconnect/screens/home.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'FreshConnect',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: [
          Image.asset('assets/images/logo.jpg', width: 300, height: 300),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Add padding
            child: Text(
              'Welcome to FreshConnect! A platform connecting farmers, consumers,communities, street vendors, and biowaste companies directly. Farmers can supply fresh produce to communities and sell biowaste to nearby companies. Street vendors can list their stores for local customers, and consumers can shop conveniently from nearby vendors. Experience fresh produce, fair trade, and sustainable practices, all in one place!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20), // Add space before the button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 62, 27), // Fixed: Use backgroundColor
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Make button bigger
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Get Started',style: TextStyle(color: Colors.white),),
          ),
          
        ],
      ),
    );
  }
}