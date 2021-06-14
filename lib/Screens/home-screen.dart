import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_application/API/SpeechApi.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/RecordScreen.dart';
import 'package:hospital_application/Utils.dart';
import 'package:hospital_application/Widget/drewer.dart';
import '../Widget/gridOfHome_widget.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/API/task_category.dart';

class Home_screen extends StatefulWidget {
  static const routName = '/Home_Screen';
  @override
  Home_screenState createState() => new Home_screenState();
}

List<task_category> taskCategory_all = new List();
List<Task> task_all = new List();

class Home_screenState extends State<Home_screen> {
  String text = "";
  bool isListening = false;
  @override
  initState() {
    getTask().then((result) {
      setState(() => task_all = result);
    });
    getTaskCategory().then((result) {
      setState(() => taskCategory_all = result);
    });

    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: <Widget>[
          SizedBox(height: 110),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4),
                    /*Text(
                      "Home",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),*/
                    // ),
                  ],
                ),
                IconButton(
                  onPressed: ()=> SpeechApi.toggleRecording(
                    onResult: (text) => setState(() => this.text = text),
                    onListening: (isListening) {
                      setState(() => this.isListening = isListening);

                      if (!isListening) {
                        Future.delayed(Duration(seconds: 1), () {
                          //Utils.scanText(text);
                          if(text=="voice")
                            {
                              Navigator.of(context).pushNamed(HomePage.routeName);
                            }

                        });
                        text = " ";
                        isListening = false;
                      }
                    },
                  ),
                  alignment: Alignment.topCenter,
                  icon: Image.asset("assets/images/mic.png", width: 24),
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          //TODO Grid Dashboard
          GridDashboard(task_all: task_all,taskCategory_all: taskCategory_all,Sound:text),
        ],
      ),
    );
 }
}
