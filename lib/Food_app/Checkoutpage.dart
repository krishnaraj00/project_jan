import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sample/trail.dart';

class CheckoutPage extends StatelessWidget {
  final List<Food> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final food = cartItems[index];
                return ListTile(
                  leading: Image.network(food.imageUrl, width: 50, height: 50),
                  title: Text(food.name),
                  subtitle: Text("\$${food.price.toStringAsFixed(2)}"),
                );
              },
            ),
            SizedBox(height: 16),
            Text('Total: \$${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment Successful!')),
                );
                Navigator.pop(context); // Go back to the home page after payment
              },
              child: Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
