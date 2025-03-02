import 'package:flutter/material.dart';
import 'package:project_jan/my%20project/final.dart';
import 'package:project_jan/shopping%20app/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginfoodapp(),
    );
  }
}

class loginfoodapp extends StatefulWidget {
  @override
  _loginfoodappState createState() => _loginfoodappState();
}

class _loginfoodappState extends State<loginfoodapp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // For form validation

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // App name or header
              Center(
                child: Text(
                  'Login Screen',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),

              // Email field with validation
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Email validation regex
                  String emailPattern =
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
                  RegExp regExp = RegExp(emailPattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 20),

              // Password field with validation
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 40),

              // Login button
              Center(
                child: ElevatedButton(
                  onPressed: _validateForm,
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validate the form fields
  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form inputs
      // If the form is valid, navigate to the homepage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodApp()),
      );
    }
  }
}
