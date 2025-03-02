import 'package:flutter/material.dart';
import 'package:project_jan/my%20project/hompagefood.dart';
import 'createmodel.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Food> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Go back to the home page
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
        ),),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final food = cartItems[index];
          return ListTile(
            leading: Image.network(food.imageUrl),
            title: Text(food.name),
            subtitle: Text("\$${food.price}"),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Proceed to checkout or payment
        },
        child: Icon(Icons.payment),
        tooltip: "Checkout",
      ),
    );
  }
}
