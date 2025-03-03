import 'package:flutter/material.dart';
import 'package:project_jan/sample/Registrationpage.dart';
import 'package:project_jan/sample/homeshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: loginpage(),
  ));
}

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final username = TextEditingController();

  final password = TextEditingController();

  late bool newuser;
  //logm  in anoo check cheyan

  late SharedPreferences prefs;

  @override
  void initState() {
    check_user_already_login();
    super.initState();
  }

  void check_user_already_login() async {
    prefs = await SharedPreferences.getInstance();
    newuser = prefs.getBool("firstlogin")!;
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homeshared()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN PAGE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                  hintText: "username", border: OutlineInputBorder()),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  hintText: "password", border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () async {
                  prefs = await SharedPreferences.getInstance();
                  String uname = username.text.trim();
                  String pass = password.text.trim();
                  if (uname != '' && pass != '') {
                    prefs.setString('username', uname);
                    prefs.setString('password', pass);
                    prefs.setBool('firstlogin', false);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => homeshared()));
                  }
                },
                child: Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => registrationpage()));
                },
                child: Text("NOT A USER ? REGISTER HERE "))
          ],
        ),
      ),
    );
  }
}
