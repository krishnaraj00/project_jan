import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_jan/storage/sqflite/sqflite_crud/sqfl_function.dart';


class contackbook extends StatefulWidget {
  @override
  State<contackbook> createState() => _contackbookState();
}

class _contackbookState extends State<contackbook> {
  List<Map<String, dynamic>> contact = []; //data base value edukan
  bool isLoading = true; // data checking,loading screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("My Contacts"),

        actions: [Expanded(
          child: SearchBar(
          leading: Icon(Icons.search,),hintText: "search",

          ),
        ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text("Create Contact")),
              PopupMenuItem(child: Text("Edit")),
              PopupMenuItem(child: Text("Delete")),
              PopupMenuItem(child: Text("Starred messages")),
              PopupMenuItem(child: Text("Payments")),
              PopupMenuItem(child: Text("Settings")),
            ];
          })
        ],


      ),
      body: isLoading
          ? Text(
        "Creat a contact",
        style: GoogleFonts.adamina(fontSize: 25),

      )
          : ListView.builder(
          itemCount: contact.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                  Colors.primaries[index % Colors.primaries.length],
                  child: Icon(Icons.person),
                ),
                title: Text(contact[index]['cname']),
                subtitle: Text(contact[index]['cnumber']),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () => showSheet(contact[index]['id']),
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () =>
                            deletecontact(contact[index]['id']),
                        icon: Icon(Icons.delete)),
                  ],
                ),

              ),

            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showSheet(null),
        child: Icon(Icons.person_add_alt_1_rounded, color: Colors.red),
      ),

    );
  }

  final name_controller = TextEditingController();
  final num_controller = TextEditingController();

  void showSheet(int? id) {
    if (id != null) {
      final existingcontact =
      contact.firstWhere((element) => element['id'] == id);
      name_controller.text = existingcontact['cname'];
      num_controller.text = existingcontact['cnumber'];
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom + 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: name_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: num_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Number"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (id == null) {
                          createcontact(
                              name_controller.text, num_controller.text);
                        }
                        if (id != null) {
                          updatecontact(id);
                        }
                        name_controller.text = "";
                        num_controller.text = "";
                        Navigator.of(context).pop();
                      },
                      child: Text(id == null ? " Create Contact" : "Update"))
                ],
              ));
        });
  }

  Future<void> createcontact(String name, String number) async {
    await SQL_Function.addnewContact(name, number);
    read_contact_and_refresh();
  }

  @override
  void initState() {
    read_contact_and_refresh();
    super.initState();
  }

  Future<void> read_contact_and_refresh() async {
    final mycontact = await SQL_Function.readcontact();
    setState(() {
      // ui refresh avan vendi annu set stateil kodukunnadh
      contact = mycontact;
      isLoading = false;
    });
  }

  Future<void> updatecontact(int id) async {
    await SQL_Function.updatecontactt(
        id, name_controller.text, num_controller.text);
    read_contact_and_refresh();
  }

  Future<void> deletecontact(int id) async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: const Text('Delete Contact ?'),
            content: const Text('Do you want to delete'),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  await SQL_Function.deletecontactt(id);
                  read_contact_and_refresh();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("successfully deleted")));
                  Navigator.pop(context);
                },
                child: const Text('YES'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('NO'),
              ),
            ],
          ),
    );
  }
}