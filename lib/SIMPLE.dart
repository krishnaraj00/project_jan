import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: bottomsheet1(),
  ));
}

class bottomsheet1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom"),
      ),
      body: Center(
        child: GestureDetector(
            onLongPress: () {
              showSheet(context);
            },
            child: Image.network('https://realfood.tesco.com/media/images/Tesco-RFO-Chicken-Tomato-Spiced-Curry-Winter18-1400x919-6cec43a2-75a6-47c5-97fa-eef420fa1831-0-1400x919.jpg'))
      ),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Text(
                "Share via",style: TextStyle(fontSize: 20),),
              Divider(),
              ListTile(leading: Icon(Icons.bluetooth),title: Text("Bluetooth"),),
              ListTile(leading: Icon(Icons.share),title: Text("Share"),),
            ],
          );
        });
  }
}
