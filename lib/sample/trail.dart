import 'package:flutter/material.dart';

// Food model class
class Food {
  final String name;
  final String imageUrl;
  final double price;

  Food({required this.name, required this.imageUrl, required this.price});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Sample food list
  final List<Food> foodList = [
    Food(
      name: 'Pizza',
      imageUrl: 'https://via.placeholder.com/150',
      price: 9.99,
    ),
    Food(
      name: 'Burger',
      imageUrl: 'https://via.placeholder.com/150',
      price: 5.99,
    ),
    Food(
      name: 'Pasta',
      imageUrl: 'https://via.placeholder.com/150',
      price: 7.99,
    ),
    Food(
      name: 'Sushi',
      imageUrl: 'https://via.placeholder.com/150',
      price: 12.99,
    ),
    // Add more items here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: foodList.length, // Set the number of items in the list
        itemBuilder: (context, index) {
          final food = foodList[index]; // Get the food item at the current index
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image.network(food.imageUrl, width: 50, height: 50), // Display the image
              title: Text(food.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text("\$${food.price}", style: TextStyle(fontSize: 16, color: Colors.green)),
              trailing: Icon(Icons.add_shopping_cart), // You can add action buttons like "Add to Cart"
              onTap: () {
                // Handle item tap (e.g., show food details)
              },
            ),
          );
        },
      ),
    );
  }
}
