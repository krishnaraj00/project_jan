import 'package:flutter/material.dart';
import 'package:project_jan/sample/login2.dart';
import 'package:project_jan/sample/logshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeshared extends StatefulWidget {
  @override
  State<homeshared> createState() => _homesharedState();
}

class _homesharedState extends State<homeshared> {
  late SharedPreferences prefs;
  String?uname;


  @override
  void initState() {
    fetchuser();
  }

  void fetchuser() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      uname = prefs.getString('username');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            children: [
              Text("WELCOME $uname"),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {
                prefs.setBool('firstlogin', true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => login2()));
              }
                  , child: Text("LOG OUT"))
            ],
          ),
        ),
      ),

    );
  }
}
