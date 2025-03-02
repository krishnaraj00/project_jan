import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Appbar1(),
  ));
}

class Appbar1 extends StatelessWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: Text("WhatsApp"),
            actions: [
              Icon(Icons.camera_alt_outlined),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.search_rounded),
              PopupMenuButton(itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("New group")),
                  PopupMenuItem(child: Text("New broadcast")),
                  PopupMenuItem(child: Text("Linked device")),
                  PopupMenuItem(child: Text("Starred messages")),
                  PopupMenuItem(child: Text("Payments")),
                  PopupMenuItem(child: Text("Settings")),
                ];
              })
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: "Chats",
                      icon: Icon(Icons.chat),
                    ),
                    Tab(
                      text: "Updates",
                      icon: Icon(Icons.update),
                    ),
                    Tab(
                      text: "Communities",
                      icon: Icon(Icons.people),
                    ),
                    Tab(
                      text: "Calls",
                      icon: Icon(Icons.call),
                    ),
                  ],
                ))),

        // body: TabBarView(children:    )
      ),
    );
  }
}
