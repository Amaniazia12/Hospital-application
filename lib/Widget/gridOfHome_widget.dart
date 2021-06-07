import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_application/Screens/patients_screen.dart';


class GridDashboard extends StatelessWidget {
  //--------------------------------------------------------------------------
  void selectCategory(BuildContext context,int action)
  {
    if(action==1) {
      Navigator.pushNamed(context, 'taskScreen');
      //Navigator.of(context).pushNamed(
      //  taskScreen.routName,

 
    }
    if(action==2) {
      //Navigator.push(context,new MaterialPageRoute(builder: (context) => new SecondScreen()),);
    }
    if(action==3) {
      //Navigator.push(context,new MaterialPageRoute(builder: (context) => new SecondScreen()),);
    }
    if(action==4) {}
    if(action==5) {}
    if(action==6) {}
  }
  //boxes in screen
  Items item1 = new Items(
      title: "Follow Up",
      subtitle: "Patient, Tesks",
      event: "",
      //img: "images/calendar.png",
      action:1);
  Items item2 = new Items(
    title: "Groceries",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    //img: "images/food.png",
      action:2
  );
  Items item3 = new Items(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    //img: "images/map.png",
    action:3
  );
  Items item4 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    //img: "images/festival.png",
      action:4
  );
  Items item5 = new Items(
    title: "To do",
    subtitle: "Homework, Design",
    event: "4 Items",
    //img: "images/todo.png",
      action:5
  );
  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    //img: "images/setting.png",
      action:6
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
   // var color = Colors.blue[400];
    return Flexible(
      child:GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children:myList.map((data) {
          return InkWell(
            onTap:()=>selectCategory(context,data.action),
            child:Container(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.asset(data.img, width: 42),
                SizedBox(height: 14),
                Text(
                  data.title,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data.subtitle,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  data.event,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                   ),
                  ),
                ),
              ],
            ),
          ),
          );
        }).toList(),
      ),
    );
  }
}
//---------------------------------------------------------------------------------
class Items {
  String title;
  String subtitle;
  String event;
  //String img;
  int action;
  Items({this.title, this.subtitle, this.event,// this.img
  this.action});
}