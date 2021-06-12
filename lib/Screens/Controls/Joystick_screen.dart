import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'anochor.dart';
import 'bone.dart';
import 'attachable.dart';
import 'Arm.dart';
import 'package:joystick/joystick.dart';
import './dart_ampq.dart';
class Joystick_screen extends StatefulWidget {

  @override
  _Joystick_screenState createState() => _Joystick_screenState();
}

class _Joystick_screenState extends State<Joystick_screen> {
    Anchor arm ;
    double xPositive=0;
    double yPositive=0;
    double xNegative=0;
    double yNegative=0;
    String eventStr;
    var deuration = const Duration( milliseconds: 250);
   @override
  void initState() {
    super.initState();
    _initialArm();
  }
  _initialArm(){
    arm = Anchor(loc: Offset(70,70));
    Bone b = Bone(70.0,arm);
    arm.child=b;
    
  }
   JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
      print( "Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}");
      eventStr="Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}";
      main(eventStr);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:Text("Robot Control",style: TextStyle (color: Colors.white))),
     body: Center(
       child: Container(
         color: Colors.white,
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Column(
           children: [
            SizedBox(height: 150,),
            Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: Image.asset('assets/images/robCont.jpg',fit:BoxFit.fill),
            ),
            Container(
             // color: Colors.pink,
              margin:EdgeInsets.only(top:320.0,),//left:MediaQuery.of(context).size.width*0.005) ,
              child: JoystickView(
              interval:  deuration,
              size: 150,
              onDirectionChanged: onDirectionChanged,
              backgroundColor: Colors.white,
              innerCircleColor: Theme.of(context).accentColor,
              showArrows: false,

              )
              )
              
            ],),
         ],),
       ),
     )
    );
  }
  }
