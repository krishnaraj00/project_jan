import 'package:flutter/material.dart';

class aboutfoodapp extends StatelessWidget {
  const aboutfoodapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),

      ),
      body: Container(
        child: Center(child: Text("GOOD APP")),
      ),
    );
  }
}
