import 'package:flutter/material.dart';
import 'package:project_jan/storage/login2.dart';
import 'package:project_jan/storage/logshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registrationpage extends StatefulWidget {



  @override
  State<registrationpage> createState() => _registrationpageState();
}

class _registrationpageState extends State<registrationpage> {
  final Name = TextEditingController();
  final Username = TextEditingController();
  final Password = TextEditingController();
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration page "),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: Name,
              decoration: InputDecoration(
                hintText: "Name",border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: Username,
              decoration: InputDecoration(
                  hintText: "Username",border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: Password,
              decoration: InputDecoration(
                  hintText: "Password",border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(onPressed: ()=>storedata(), child: Text("REGISTER"))
        ],
      ),
    );
  }

  void storedata() async {
    String name = Name.text;
    String uname = Username.text;
    String pass  = Password.text;

    prefs = await SharedPreferences.getInstance();
    prefs.setString('Name', name);
    prefs.setString('Username', uname);
    prefs.setString('Password', pass);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login2()));
  }
}
