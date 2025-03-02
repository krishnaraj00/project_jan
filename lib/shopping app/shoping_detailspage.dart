import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> item;

  DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(item['image']!),
            SizedBox(height: 20),
            Text(item['name']!, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text(item['description']!, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(item['price']!, style: TextStyle(fontSize: 20, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
