import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/API/task_category.dart';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Widget/get_category.dart';
import 'package:hospital_application/Widget/get_task.dart';
import 'package:hospital_application/Widget/task_widget.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import '../API/task_api.dart';

class taskScreen extends StatefulWidget {
  const taskScreen({Key key}) : super(key: key);
  static String routName = 'taskScreen';
  @override
  _taskScreenState createState() => _taskScreenState();
}

List<task_category> taskCategory_all = new List();
List<Task> task_all = new List();

class _taskScreenState extends State<taskScreen> {
  @override
  initState() {
    getTask().then((result) {
      setState(() => task_all = result);
    });
    super.initState();
  }

  List<bool> listview = [false, false, false, false, false, false, false];
  List<Task> getTaskCat(int CategoryId) {
    List<Task> taskWithCategory = new List();
    for (var t in task_all) {
      if (t.task_type == CategoryId) {
        taskWithCategory.add(t);
      }
    }
    return taskWithCategory;
  }

  @override
  Widget build(BuildContext context) {
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
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: Text(
                              snapshot.data[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                listview[index] = true;
                              });
                            },
                          ),
                        ),
                        Container(
                            child: listview[index] == true
                                ? task_widget(
                                    task: getTaskCat(snapshot.data[index].id))
                                : Text(""))
                      ],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
