import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_jan/shopping%20app/shoping_detailspage.dart';


class HomePageshop extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/image/dress2.jpeg', // replace with your image path
      'name': 'Shirts',
      'description': 'Look Like SuperStar',
      'price': '1200.Rs',
    },
    {
      'image':
          'assets/image/istockphoto-186870715-612x612 (1).jpg', // replace with your image path
      'name': 'Jeans',
      'description': ' your comfort',
      'price': '1900.Rs',
    },
    {
      'image':
          'assets/image/Folded_Shirts_1000_0001.jpg', // replace with your image path
      'name': 'Shrit',
      'description': 'choose your comfort',
      'price': '1000.Rs',
    },
    {
      'image':
          'assets/image/istockphoto-186870715-612x612 (1).jpg', // replace with your image path
      'name': 'Jeans',
      'description': 'choose your comfort',
      'price': '1110.Rs',
    },
    // Add more items here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Home Page',
            style: GoogleFonts.alatsi(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Remove default padding
          children: <Widget>[
            // Drawer Header (Optional)
            UserAccountsDrawerHeader(
              accountName: Text("Krishnaraj"),
              accountEmail: Text("Krishna@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("KJ"),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          // Horizontal GridView
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(item: items[index])),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(items[index]['image']!,
                            width: 120, height: 120),
                        SizedBox(height: 8),
                        Text(items[index]['name']!,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(items[index]['price']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Vertical ListView
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(items[index]['image']!,
                      width: 50, height: 50),
                  title: Text(items[index]['name']!),
                  subtitle: Text(items[index]['description']!),
                  trailing: Text(items[index]['price']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(item: items[index])),
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
