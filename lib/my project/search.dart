import 'package:flutter/material.dart';

import 'createmodel.dart';
import 'food_detail_page.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Food> foodList = [
    Food(id: 1, name: 'Burger', description: 'A delicious beef burger.', imageUrl: 'https://example.com/burger.jpg', price: 5.99),
    Food(id: 2, name: 'Pizza', description: 'Cheesy and delicious pizza.', imageUrl: 'https://example.com/pizza.jpg', price: 8.99),
    // More food items
  ];
  List<Food> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = foodList;
    _searchController.addListener(_filterFoods);
  }

  void _filterFoods() {
    setState(() {
      filteredList = foodList.where((food) {
        return food.name.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Food')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for food...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final food = filteredList[index];
                return ListTile(
                  leading: Image.network(food.imageUrl),
                  title: Text(food.name),
                  subtitle: Text("\$${food.price}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(food: food),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
