import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:http/http.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HiveTodo(),
  ));
}

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  List<Map<String, dynamic>> task = []; //take value from hive
  final my_box = Hive.box('todo_box');
  @override
  void initState() {
    readtask_refreshui();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
                  'My Task',
                  style: GoogleFonts.actor(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Remove default padding
          children: <Widget>[
            // Drawer Header (Optional)
            UserAccountsDrawerHeader(
              accountName: Text("Krishnaraj"),
              accountEmail: Text("Krishnarajkkk@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("KJ"),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: IconButton(onPressed: () {}, icon: Icon(Icons.share))),
          TabItem(
              icon: IconButton(
                  onPressed: () => showAlertbox(null),
                  icon: Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.white,
                  ))),
          TabItem(icon: IconButton(onPressed: () {}, icon: Icon(Icons.person))),
        ],
        initialActiveIndex: 2,
      ),
      body: task.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: task.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${task[index]['tname']}',
                        style: GoogleFonts.abel(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        task[index]['tdsp'],
                        overflow: TextOverflow.visible,
                        maxLines: 5,
                        style: GoogleFonts.adamina(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),

                      ),
                      Text('${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                        overflow: TextOverflow.visible,
                        maxLines: 5,
                        style: GoogleFonts.adamina(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),

                      ),

                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () => showAlertbox(task[index]['id']),
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () => deletetask(task[index]['id']),
                              icon: Icon(Icons.delete)),
                        ],
                      )),
                    ],
                  ),
                );
              }),
    );
  }

  final title_cntrl = TextEditingController();
  final descrip_cntrl = TextEditingController();

  void showAlertbox(int? key) {
    if (key != null) {
      final exiting_task = task.firstWhere((_element) => _element['id'] == key);
      title_cntrl.text = exiting_task['tname'];
      descrip_cntrl.text = exiting_task['tdsp'];
    } //update notes
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Title'),
                  controller: title_cntrl,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'content'),
                  controller: descrip_cntrl,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (title_cntrl.text != "" && descrip_cntrl.text != "") {
                      createtask({
                        'taskname': title_cntrl.text.trim(),
                        'tcontent': descrip_cntrl.text.trim(),
                      });
                    }

                    title_cntrl.text = "";
                    descrip_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: Text("Creat Task")),
              TextButton(
                  onPressed: () {
                    updatetask(key, {
                      'taskname': title_cntrl.text.trim(),
                      'tcontent': descrip_cntrl.text.trim(),
                    });
                    title_cntrl.text = "";
                    descrip_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
            ],
          );
        });
  }

  Future<void> createtask(Map<String, dynamic> my_task) async {
    await my_box.add(my_task);
    readtask_refreshui();
  }

  void readtask_refreshui() {
    final task_from_hive = my_box.keys.map((key) {
      final value = my_box.get(key);
      return {'id': key, 'tname': value['taskname'], 'tdsp': value['tcontent']};
    }).toList();
    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

//updating hive task
  Future<void> updatetask(int? key, Map<String, dynamic> updatedtask) async {
    await my_box.put(key, updatedtask);
    readtask_refreshui();
  }

  Future<void> deletetask(int key) async {
    await my_box.delete(key);
    readtask_refreshui();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("successfully Deleted")));
  }
}
