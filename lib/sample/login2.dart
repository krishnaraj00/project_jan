import 'package:flutter/material.dart';
import 'package:project_jan/sample/Registrationpage.dart';
import 'package:project_jan/sample/homeshared.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main(){
  runApp(MaterialApp(home: login2(),));
}

class login2 extends StatefulWidget {
  const login2({super.key});

  @override
  State<login2> createState() => _login2State();
}

class _login2State extends State<login2> {
  final Username = TextEditingController();
  final Password = TextEditingController();
  late SharedPreferences preferences;
  late bool Newuser;

  @override
  void initState() {
    check_already_login();

    super.initState();
  }
  void check_already_login() async {
    preferences = await SharedPreferences.getInstance();
    Newuser = preferences.getBool("firstlogin")!;
    if (
    Newuser == false
    ) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homeshared()));
    }
  }



Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page "),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: Username,
              decoration: InputDecoration(
                  hintText: "username", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: Password,
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),
ElevatedButton(onPressed: ()=>validateandlogin(), child: Text("login")),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>registrationpage()));

          }, child: Text("REGISTER"))
        ],
      ),
    );
  }

  void validateandlogin()async {
    preferences=await SharedPreferences.getInstance()!;
    String storeduname=preferences.getString('Username')!;
    String storedpass=preferences.getString('Password')!;

    String usname =Username.text;
    String pad = Password.text;
    preferences.setBool('Newuser', false);

    if(storeduname == usname && storedpass==pad){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homeshared()));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("invalid username  or password")));
    }
  }
  }

