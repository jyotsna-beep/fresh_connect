import 'package:flutter/material.dart';
import 'order_confirmation.dart';

class PaymentScreen extends StatefulWidget {
  final double totalPrice;

  const PaymentScreen({required this.totalPrice, super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = '';
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  void proceedToConfirmation() {
    if (selectedPaymentMethod == 'Card' &&
        (cardNumberController.text.isEmpty ||
            expiryDateController.text.isEmpty ||
            cvvController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter card details.')),
      );
    } else if (selectedPaymentMethod.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a payment method.')),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderConfirmationScreen(totalPrice: widget.totalPrice),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment Method'),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a payment method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile<String>(
              title: const Text('Card'),
              value: 'Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            if (selectedPaymentMethod == 'Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: cardNumberController,
                    decoration: const InputDecoration(labelText: 'Card Number'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: expiryDateController,
                    decoration: const InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                    keyboardType: TextInputType.datetime,
                  ),
                  TextField(
                    controller: cvvController,
                    decoration: const InputDecoration(labelText: 'CVV'),
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            RadioListTile<String>(
              title: const Text('Cash'),
              value: 'Cash',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Pay on Delivery (POD)'),
              value: 'POD',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: proceedToConfirmation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Proceed to Confirmation'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}