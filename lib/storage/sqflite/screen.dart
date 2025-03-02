import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:project_jan/storage/sqflite/contactbook.dart';

void main() {
  runApp(
    MaterialApp(
      home: splash2(),
    ),
  );
}

class splash2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => splash2State();
}

class splash2State extends State {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>contackbook()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Colors.yellow,
      body: Container(
        child:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2018/04/28/17/38/contact-icon-3357824_1280.png",


                  ),
                  height: 100,
                ),
                Text('My Contact',
                    style: GoogleFonts.adamina(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),

      )

    );
  }
}
