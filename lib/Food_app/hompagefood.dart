import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_jan/Food_app/settingsfoodapp.dart';
import 'aboutfoodapp.dart';
import 'cartpage.dart';
import 'createmodel.dart';

import 'food_detail_page.dart';


class HomePage extends StatelessWidget {
  final List<Food> foodList = [
    Food(
      id: 1,
      name: 'Burger',
      description: 'A delicious beef burger.',
      imageUrl:
          'https://realfood.tesco.com/media/images/RFO-1400x919-SpicyChickenBurger-98fc9913-fd2d-4559-b047-086ff4871a01-0-1400x919.jpg',
      price: 110,
    ),
    Food(
      id: 2,
      name: 'Pizza',
      description: 'Cheesy and delicious pizza.',
      imageUrl:
          'https://realfood.tesco.com/media/images/1400x919-Spring-Florentine-pizza-8f1727df-9f7e-4d4d-8e0a-98ee0531568b-0-1400x919.jpg',
      price:200,
    ),
    Food(
      id: 3,
      name: 'Poratta',
      description: 'Super poratta.',
      imageUrl:
          'https://paattiskitchen.com/wp-content/uploads/2022/12/kmc_20221227_200339-1200x675.jpg',
      price: 12,
    ),
    Food(
      id: 4,
      name: 'Biriyani',
      description: 'Cheesy and delicious pizza.',
      imageUrl:
          'https://ministryofcurry.com/wp-content/uploads/2024/06/chicken-biryani.jpg',
      price: 90,
    ),
    Food(
      id: 5,
      name: 'Dosha',
      description: 'Cheesy and delicious pizza.',
      imageUrl:
          'https://www.sailusfood.com/wp-content/uploads/2013/06/mysore-masala-dosa-recipe.jpg',
      price: 60,
    ),
    Food(
      id: 6,
      name: 'Chiken Curry',
      description: 'Spacy and Testy.',
      imageUrl:
          'https://realfood.tesco.com/media/images/Tesco-RFO-Chicken-Tomato-Spiced-Curry-Winter18-1400x919-6cec43a2-75a6-47c5-97fa-eef420fa1831-0-1400x919.jpg',
      price:120,
    ),
    Food(
      id: 7,
      name: 'Beef',
      description: 'wow delicious .',
      imageUrl:
          'https://i0.wp.com/mariasmenu.com/wp-content/uploads/Kerala-Beef-Fry.png?w=650&ssl=1',
      price: 110,
    ),
    Food(
      id: 8,
      name: 'Sandwich',
      description: 'Cheesy and delicious .',
      imageUrl:
          'https://realfood.tesco.com/media/images/1400x919-Grinder-Sandwich-4bfbfc7b-e232-404a-8cc2-f4d67c2547b9-0-1400x919.jpg',
      price: 70,
    ),
    Food(
      id: 9,
      name: 'French Fries',
      description: 'crispy and testy.',
      imageUrl:
          'https://realfood.tesco.com/media/images/1400x919-Buffalo-fries-466e1155-2b54-44ea-ae5d-d7a0e18f13c2-0-1400x919.jpg',
      price: 100,
    ),
    // Add more food items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
                    'Food App',
                    style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.white,
                    ),
                  ),
          ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search))
      ],),
      drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero, // Remove default padding
      children: <Widget>[
        // Drawer Header (Optional)
        UserAccountsDrawerHeader(decoration: BoxDecoration(color: Colors.red),
          accountName: Text("Krishnaraj"),
          accountEmail: Text("Krishnarajkkk@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text("KJ"),
          ),
        ),
        // Drawer items
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            // Navigate to Home (or any other page)
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => settingsfoodapp()),
            );
            // Navigate to Settings (or any other page)
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => aboutfoodapp()),
            );
            // Navigate to Settings (or any other page)
            // Navigate to About page (or any other page)
          },
        ),
      ],
    ),
    ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns in the grid
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final food = foodList[index];
          return GestureDetector(
            onTap: () {
              // Action when the grid item is tapped
              // For example, navigate to a detailed food page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(food: food), // Pass the food item to the detail page
                ),
              );
            },
            child: Card(color: Colors.redAccent,
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                children: [
                  Image.network(
                    food.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8), // Space between image and text
                  Text(
                    food.name,
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text("\Rs-${food.price.toStringAsFixed(2)}",style: TextStyle(color: Colors.white,fontSize: 15),), // Display price with 2 decimal places
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: ConvexAppBar(backgroundColor: Colors.white,
        style: TabStyle.react,
        items: [
          TabItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                icon: Icon(Icons.shopping_cart,size: 38)),
          ),
          TabItem(icon: Icon(Icons.home,size: 38)),
          TabItem(icon: Icon(Icons.person,size: 38,)),
        ],
      ),
    );
  }
}
