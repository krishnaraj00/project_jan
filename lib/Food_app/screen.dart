import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginpagfoodapp.dart';

void main(){
  runApp(MaterialApp(
    home:foodscreen(),
  ));
}

class foodscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>foodscreenState();
}

class foodscreenState extends State {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>loginfoodapp()));
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
                    "https://images-platform.99static.com/A_Ax0GQuo_NHI0Y7XZHmFtGfBDY=/0x0:1000x1000/500x500/top/smart/99designs-contests-attachments/126/126252/attachment_126252018",


                  ),
                  height: 100,
                ),
                Text('Foodie',
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
