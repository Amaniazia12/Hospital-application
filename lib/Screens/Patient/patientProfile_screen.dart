
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/Models/patientClass.dart';
import 'package:hospital_application/Screens/Patient/reports_Screen.dart';
import '../../Models/dummyData.dart';
import '../categoriesOFTasks_Screen.dart';
class PationtProfile_screen extends StatelessWidget {
 static const routeName ='/pationtProfile';

  Widget _infoCol(String title , String info){
    return Container(
      color: Colors.white,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget> [
       Text( "  " + title + ": " , style: TextStyle (color: Colors.grey[500])),
       Text( "  " + info , style: TextStyle ( color: Colors.black54,fontSize: 18 )),
       SizedBox(height: 50,)
      ],),
    );

  }
  
  Widget _btn( String title , Function fun  , BuildContext context){
    return Column(
      children: <Widget>[
         Container(
                color: Colors.white,
                width: double.infinity,
                child:FlatButton(
                  onPressed: fun,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  color: Colors.blue[200],
                  height: 50,
                  child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ),
              ),
        Container( height: 10,  width: MediaQuery.of(context).size.width ,  color: Colors.white, child: SizedBox(height: 10,)),
      ],
    );
   
  }
 
 void _addTaskFunction (BuildContext ctx){
   Navigator.of(ctx).pushNamed(
     CategoriesOfTask.routName,
   );
 }

 void _report (BuildContext ctx ){
   Navigator.of(ctx).pushNamed(
     Report_screen.routeName,
     arguments:  {
        
       }
  
   );
 }
 


  @override
  Widget build(BuildContext context) {

    final patient = ModalRoute.of(context).settings.arguments as Map <String , Patient> ;
    
    return Scaffold(
      appBar: AppBar(title:Text("Patient Profile ",style: TextStyle (color: Colors.white))),
      backgroundColor: Theme.of(context).primaryColor,
      body:  SingleChildScrollView(
       child: Column(
        children: <Widget>[
          //SizedBox(height: MediaQuery.of(context).size.height*0.05),
          Stack(
            children:<Widget> [ 
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05*3),
              height: MediaQuery.of(context).size.height*0.14,
              width: MediaQuery.of(context).size.width ,
              decoration:BoxDecoration( borderRadius:BorderRadius.only( topRight: Radius.circular(50.0),topLeft: Radius.circular(50.0),), color: Colors.white,  ),),  
            Center(
              child: Container(
                height:MediaQuery.of(context).size.height*0.25,
                width:MediaQuery.of(context).size.height*0.25,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(patient['patient'].image,), ))), 
            ],
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width ,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(" Patient " , style: TextStyle(
                       fontSize: 24 ,
                       fontWeight: FontWeight.w500,
                       color: Colors.black87,
                     ),),
            ),
          ),
          
           _infoCol("Nationality", patient['patient'].nationality),
           _infoCol("Stay_room  ", patient['patient'].stay_room.toString()),
           _infoCol("Check in   ", patient['patient'].check_in.toString()),
           _infoCol("Check out  ", patient['patient'].check_out.toString()),
           _infoCol("Age        ", patient['patient'].age.toString()),
           _infoCol("Mobile     ", patient['patient'].mobile.toString()),
           _infoCol("User       ", patient['patient'].user.toString()),
           _btn("Add Task", _addTaskFunction , context),
           /*_btn("History", (){} , context),
           _btn("Reports", (){} , context),
           */
          ]
        )
      )
    );
  }
}