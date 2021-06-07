import 'package:flutter/material.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';

class task_widget extends StatelessWidget {
  List<Task> task;

  task_widget({this.task});

  //List<Task> tFinal = [];

  ViewTask() {
    return SizedBox(
      height: (task.length * 50).toDouble(),
      child: ListView.builder(
        itemCount: task.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            //height: MediaQuery.of(context).size.width * 0.1,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue[50],
                      blurRadius: 20.0,
                      offset: Offset(0, 10))
                ]),
            child: GestureDetector(
              //width: MediaQuery.of(context).size.width*0.85,
              child: Text(
                task[index].name,
              ),
              onTap: () {
                // Navigator.pushNamed(context, 'LoginSuccessScreen');
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewTask();
  }
}

/**
 * Container(
      child: ListView.builder(
        itemCount: getTaskCat().length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue[50],
                        blurRadius: 20.0,
                        offset: Offset(0, 10))
                  ]),
              child: GestureDetector(
                //width: MediaQuery.of(context).size.width*0.85,
                child: Text(
                  tt[index].name,
                ),
                onTap: () {
                  // Navigator.pushNamed(context, 'LoginSuccessScreen');
                },
              ),
            ),
          );
        },
      ),
    );
 */