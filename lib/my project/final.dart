import 'package:flutter/material.dart';
import 'package:project_jan/my%20project/search.dart';
import 'package:project_jan/my%20project/user.dart';
import 'cartpage.dart';
import 'hompagefood.dart';


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/cart': (context) => CartPage(),
        '/search': (context) => SearchPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
