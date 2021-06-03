import 'package:flutter/material.dart';
import '../Models/doctorClass.dart';
import '../Models/dummyData.dart';
import 'patients_screen.dart';

class Doctor_Screen extends StatelessWidget {
   final idcontroller = TextEditingController();
   String doctorId;
  void submitLimits(BuildContext context) {
    
     doctorId = idcontroller.text;
    if ( doctorId == " " ) {
      return;
    }
  }
  void _nextScreen (BuildContext cont ){
    Navigator.of(cont).pushNamed(
       PationtScreen.routName,
       arguments: doctorId,
      );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
        decoration: InputDecoration(labelText: '  min'),
        keyboardType: TextInputType.number,
        controller: idcontroller,
        onSubmitted: (_) => submitLimits(context),
      ),
      GestureDetector(
        child: Text('Movement Configration'),
        onTap: ()=>_nextScreen(context),
      )
      ],)
      
    );
  }

  
}