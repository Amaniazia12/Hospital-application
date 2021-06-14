//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/RecordScreen.dart';
import 'package:hospital_application/Screens/charging_screen.dart';
import 'package:hospital_application/Screens/patients_screen.dart';

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  int action;
  Items({this.title, this.subtitle, this.event, this.img, this.action});
}
//boxes in screen
Items item1 = new Items(
    title: "Follow Up",
    subtitle: "Patient, Tesks",
    event: "",
    img: "assets/images/todo.png",
    action: 1);
Items item2 = new Items(
    title: "Voice",
    subtitle: "Celling robot",
    event: " ",
    img: "assets/images/mic.png",
    action: 2);
Items item3 = new Items(
    title: "Locations",
    subtitle: "Robot going to somewhere",
    event: "",
    img: "assets/images/map.jpg",
    action: 3);
Items item4 = new Items(
    title: "VideoCell",
    subtitle: "",
    event: "",
    img: "assets/images/video.jpg",
    action: 4);
Items item5 = new Items(
    title: "Motion",
    subtitle: "control Move of robot",
    event: " ",
    img: "assets/images/robpngg.png",
    action: 5);
Items item6 = new Items(
    title: "Charging",
    subtitle: "",
    event: "2 Items",
    img: "assets/images/charging.png",
    action: 6);
//------------------------------------------------
class GridDashboard extends StatelessWidget {
  List<Task> task_all;
  List<task_category> taskCategory_all;
  String Sound = "";

  GridDashboard({this.taskCategory_all, this.task_all,this.Sound});

  //--------------------------------------------------------------------------
  void selectCategory(BuildContext context, int action) {
    if (action == 1) {
      Navigator.of(context).pushNamed(PationtScreen.routName,
          arguments: {"task": task_all, "task_category": taskCategory_all});
    }
    if (action == 2) {
      Navigator.of(context).pushNamed(HomePage.routeName);
      if (action == 3) {
        //Navigator.push(context,new MaterialPageRoute(builder: (context) => new SecondScreen()),);
      }
      if (action == 4) {
        //Not implement yet
      }
      if (action == 5) {
        //Not implement yet
      }
      if (action == 6) {
        Navigator.of(context)
            .pushNamed(chargingScreen.routName, arguments: {"task": task_all});
        //Not implement yet
      }
    }
  }
  static List<Items> myList = [item1, item2, item3, item4, item5, item6];
  @override
  Widget build(BuildContext context) {

    // var color = Colors.blue[400];
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return InkWell(
            onTap: () => selectCategory(context, data.action),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.img, width: 42),
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