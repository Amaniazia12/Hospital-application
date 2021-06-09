import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        drawer: drewer(),
        //backgroundColor: Colors.blue[200],
        body:
            //TODO Grid Dashboard
            GridDashboard(
                task_all: task_all, taskCategory_all: taskCategory_all));
  }
}
