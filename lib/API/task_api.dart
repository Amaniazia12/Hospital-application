import 'dart:io';

import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<Task>> getTask() async{
  final taskData=await http.get(Uri.parse("https://robohub.pythonanywhere.com/Tasks/TaskAPI/"),
      headers: {HttpHeaders.contentTypeHeader:"application/json",HttpHeaders.authorizationHeader  : "token b194bda7a92bc7000d569b830a565a89a2b66993"});

 var jsonData=json.decode(taskData.body);
  List<Task> task_all=[];

    for (var task in jsonData) {
      //Task t = Task(id: task["id"],name: task["neme"] , task_type: task["task_type"]);
      //task['id'],task["name"] , task["type"]);
      task_all.add(Task.fromJson(task));
    }
    //print (task_aength) ;
    return task_all;

}