import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
void main (){
  runApp(MaterialApp(
    home: permission_check1(),
  ));
}

class permission_check1 extends StatefulWidget {


  @override
  State<permission_check1> createState() => _permission_check1State();
}

class _permission_check1State extends State<permission_check1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("permission"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: requestCameraPermission,child: Text("Request Camera Permission",style: TextStyle(fontSize: 15),),  ),
            ElevatedButton(onPressed: requestMultiplePermission,child: Text("Request Multiple Permission",style: TextStyle(fontSize: 15),),   ),
            ElevatedButton(onPressed: requestPermissionWithOpenSettings,child: Text("Open Permission Settings",style: TextStyle(fontSize: 15),),  )

          ],

        ),
      ),
    );
  }

  void requestCameraPermission() async{
    var status = await Permission.camera.status;
    if(
    status.isGranted
    ){
      print("Permission Granted");
    }else if(status.isDenied){
      if (await Permission.camera.request().isGranted){
        print("Permission was Granted");
      }
    }
  }

  void requestMultiplePermission() async{
  }

  void requestPermissionWithOpenSettings() {
  }
}
