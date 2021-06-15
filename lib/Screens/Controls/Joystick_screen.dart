import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:hospital_application/Screens/Controls/controlSliders_widgit.dart';
import 'package:hospital_application/Screens/Controls/setting_screen.dart';
import 'anochor.dart';
import 'bone.dart';
import 'setting_screen.dart';
import 'attachable.dart';
import 'Arm.dart';
import 'package:joystick/joystick.dart';
import './dart_ampq.dart';
import 'package:hospital_application/blocs/auth_events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_switch/flutter_switch.dart';

class Joystick_screen extends StatefulWidget {
static String routeName='/joystick';
  @override
  _Joystick_screenState createState() => _Joystick_screenState();
}

class _Joystick_screenState extends State<Joystick_screen> {
    Anchor arm ;
    String eventStr;
    int right=0;
    int left =0 ; 
    bool leftbool=false;
    bool rightbool=false;
    bool mouthtbool=false;
    var deuration = const Duration( milliseconds: 100);
    List<double>  minListLeft =[0,0,0,0] ;
    List<double> maxListLeft=[180,180,180,180];
    static List<TextEditingController> ValControllLeft = List.generate(10, (i) => TextEditingController()) ;
     List<double>  minListRight =[0,0,0,0] ;
    List<double> maxListRight=[180,180,180,180];
    static List<TextEditingController> ValControllRight = List.generate(10, (i) => TextEditingController()) ;
  
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
   

   sendDirections(String eventStr) async {
    final response = await http.post(
        Uri.parse('http://192.168.137.117:8000/Tasks/SendMotion/'),
        body: {'directions': eventStr },
        headers: {});
   }
   
   void motionLeft()async{
     final response = await http.post(
        Uri.parse('http://192.168.137.117:8000/Tasks/SendMotion/'),
        body: {'left': "1" },
        headers: {});
   }

   void motionRight()async{
     final response = await http.post(
        Uri.parse('http://192.168.137.117:8000/Tasks/SendMotion/'),
        body: {'Right': "1" },
        headers: {});
   }
   void cameraMotion()async{
     final response = await http.post(
        Uri.parse('http://192.168.137.117:8000/Tasks/SendMotion/'),
        body: {'Right': "1" },
        headers: {});
   }
   void mouseMotion()async{
     final response = await http.post(
        Uri.parse('http://192.168.137.117:8000/Tasks/SendMotion/'),
        body: {'Right': "1" },
        headers: {});
   }
   action (String name , IconData iconbtn ,Function fun , double sizebtn ,){
     return Container(
      height: sizebtn,
      width: sizebtn,
      child: FlatButton(
                  onPressed: fun,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizebtn)),
                  height: 50,
                  child:Icon(iconbtn , color:Colors.blue[200],size: sizebtn,), 
                ), 
      
     );
   }
   
   JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
      print( "Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}");
      eventStr="Degree : ${degrees.toStringAsFixed(2)}, Distance : ${distance.toStringAsFixed(2)}";
      sendDirections(eventStr);
      //main(eventStr);

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
            //Camera and mouth
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               action("name",Icons.camera_alt_rounded, cameraMotion , 40),
            ],),
            Container(
              padding: EdgeInsets.only(top: 100 ),
              child: Stack(
                children: [ 
                   //image 
                    Container(
                      padding: EdgeInsets.only(left: 100 ),
                      height: MediaQuery.of(context).size.height*0.5,
                      child: Image.asset('assets/images/roboot.jpeg',fit:BoxFit.fill),
                    ),

                    //Head 
                    Container(
                      margin: EdgeInsets.only(top: 25,left: MediaQuery.of(context).size.width*0.22,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                      action("name", Icons.arrow_left, motionLeft,50),
                      SizedBox(width: 15,),
                      Switch(
                        activeColor:Theme.of(context).primaryColor, 
                        value: mouthtbool, 
                        onChanged:(newValue) {setState((){mouthtbool = newValue;},);},),
                      action("name", Icons.arrow_right,motionRight,50),
                        ]
                      ),
                      ),

                    //Hand
                    Container(
                      margin: EdgeInsets.only(top: 200 ,left: MediaQuery.of(context).size.width*0.22,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                      Switch(
                        activeColor:Theme.of(context).primaryColor, 
                        value: leftbool, 
                        onChanged:(newValue) {setState((){leftbool = newValue;},);},),
                      SizedBox(width: 60,),
                      
                      Switch(
                        activeColor:Theme.of(context).primaryColor, 
                        value: rightbool, 
                        onChanged:(newValue) {setState((){rightbool = newValue;},);},),
                        ]
                      ),
                    ),


                    //body
                    Container(
                      margin:EdgeInsets.only(top:300.0,),
                      child: JoystickView(
                    // interval:  deuration,
                      size: 150,
                      onDirectionChanged: onDirectionChanged,
                      backgroundColor: Colors.white,
                      innerCircleColor: Theme.of(context).accentColor,
                      showArrows: false,  )),
                    
                    //Arms 
                    Container(
                      margin: EdgeInsets.only(top: 70,left: MediaQuery.of(context).size.width*0.22,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                      children: [
                      FlatButton(
                        onPressed: (){
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                                return Container(
                                      height: 500,
                                      //color: Colors.amber, 
                                      child:ListView .builder(
                                            shrinkWrap: true,
                                            itemBuilder: (ctx,index){
                                              return SliderWidget(
                                                max: maxListLeft[index],
                                                min: minListLeft[index],
                                                tec:ValControllLeft[index],
                                                );
                                                },
                                            itemCount: 2,
                                          ) ,); },);},
                        child: Icon(Icons.settings,color: Colors.blueGrey,)
                        ),
                      SizedBox(width: 15,),
                      FlatButton(onPressed:(){ 
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                                return Container(
                                      height: 500,
                                      //color: Colors.amber, 
                                      child:ListView .builder(
                                            shrinkWrap: true,
                                            itemBuilder: (ctx,index){
                                              return SliderWidget(
                                                max: maxListRight[index],
                                                min: minListRight[index],
                                                tec:ValControllRight[index],
                                                );
                                                },
                                            itemCount: 2,
                                          ) ,); },);},
                      
                          child: Icon(Icons.settings , color: Colors.blueGrey,)),
                      ]
                      ),
                    ),
                    //Arms 
                    Container(
                      margin: EdgeInsets.only(top: 130,left: MediaQuery.of(context).size.width*0.22,),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                      children: [
                      FlatButton(
                        onPressed: (){
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                                return Container(
                                      height: 500,
                                      //color: Colors.amber, 
                                      child:ListView .builder(
                                            shrinkWrap: true,
                                            itemBuilder: (ctx,index){
                                              return SliderWidget(
                                                max: maxListLeft[index],
                                                min: minListLeft[index],
                                                tec:ValControllLeft[index],
                                                );
                                                },
                                            itemCount: 2,
                                          ) ,); },);},
                        child: Icon(Icons.settings,color: Colors.blueGrey,)
                        ),
                      SizedBox(width: 15,),
                      FlatButton(onPressed:(){ 
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                                return Container(
                                      height: 500,
                                      //color: Colors.amber, 
                                      child:ListView .builder(
                                            shrinkWrap: true,
                                            itemBuilder: (ctx,index){
                                              return SliderWidget(
                                                max: maxListRight[index],
                                                min: minListRight[index],
                                                tec:ValControllRight[index],
                                                );
                                                },
                                            itemCount: 2,
                                          ) ,); },);},
                      
                          child: Icon(Icons.settings , color: Colors.blueGrey,)),
                      ]
                      ),
                    ),
                
                ],
               ),
             ),
            ],
           ),
         ),
       ),
     );
   }
  }
