import 'package:flutter/material.dart';
import 'createmodel.dart';
import 'food.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;

  FoodDetailPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(food.imageUrl),
            SizedBox(height: 20),
            Text(food.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(food.description),
            SizedBox(height: 20),
            Text("Price: \ ${food.price}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add food item to cart
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${food.name} added to cart")));
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
