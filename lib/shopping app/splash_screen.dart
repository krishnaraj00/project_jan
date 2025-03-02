import 'package:flutter/material.dart';
import 'dart:async';
import 'package:project_jan/shopping%20app/Login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPageshop()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/360_F_248419312_JiP5h9OBTgZsTRnHZwntiiShjHveffPp.jpg', width: 300, height: 300),
            // Replace with your image
            SizedBox(height: 20),
            Text('FASHION',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
