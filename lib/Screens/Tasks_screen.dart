import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/API/task_category.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Models/patientClass.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';
import 'package:hospital_application/Widget/task_widget.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import '../API/task_api.dart';

class taskScreen extends StatefulWidget {
  const taskScreen({Key key}) : super(key: key);
  static String routName = '/taskScreen';
  @override
  _taskScreenState createState() => _taskScreenState();
}

List<task_category> taskCategory_all = new List();
List<Mission> missionList = new List();
List<Task> task_all = new List();

class _taskScreenState extends State<taskScreen> {
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

  //List<bool> listview = [false, false, false, false, false, false, false];
  List<Task> getTaskCat(int CategoryId) {
    List<Task> taskWithCategory = new List();
    for (var t in task_all) {
      if (t.task_type == CategoryId) {
        taskWithCategory.add(t);
      }
    }
    return taskWithCategory;
  }

  Widget columncat(task_category taskCategory_all) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          //child: GestureDetector(
          child: Text(
            taskCategory_all.name,
            style: TextStyle(
                //te :start,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            child: task_widget(
                taskcat: taskCategory_all,
                patientid: 1,
                task: getTaskCat(taskCategory_all.id))),
      ],
    );
  }

  listTasksCheck() {
    setState(() {
      missionList = Mission.mission.cast<Mission>();
      return Column(
          children:
              taskCategory_all.map((category) => columncat(category)).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final patientID =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        child: FutureBuilder(
          future: getTaskCategory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    listTasksCheck(),
                    Column(
                        children: taskCategory_all
                            .map((category) => columncat(category))
                            .toList()),
                    Container(
                      height: 50,
                      child: GestureDetector(
                          //width: MediaQuery.of(context).size.width*0.85,
                          child: gradient_button("Send Task"),
                          onTap: () {
                            Mission.submitTask(
                                context, task_all, taskCategory_all);
                            //Navigator.of(context).pop(context);
                          }),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
