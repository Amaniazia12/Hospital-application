import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';

class Joystick_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:Text("Robot Control",style: TextStyle (color: Colors.white))),
     body: Container(
       child: Column(

         children: [
           
         JoystickView(
           backgroundColor: Theme.of(context).primaryColor,
           innerCircleColor: Theme.of(context).accentColor,
           //size: 180,
         ),
       ],),
     )
    );
  }
}