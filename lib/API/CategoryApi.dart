import 'dart:io';

import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/categoryClass.dart';


    Future <List<task_category>> getCategory() async{
    final taskData=await http.get(Uri.parse("https://robohub.pythonanywhere.com/Tasks/TaskAPI/"),
    headers: {HttpHeaders.contentTypeHeader:"application/json",HttpHeaders.authorizationHeader  : "token b194bda7a92bc7000d569b830a565a89a2b66993"});

    var jsonData=json.decode(taskData.body);
    List<task_category> task_all_cat=[];

    for (var category in jsonData) {
    //Task t = Task(id: task["id"],name: task["neme"] , task_type: task["task_type"]);
    //task['id'],task["name"] , task["type"]);
    task_all_cat.add(task_category.fromJson(category));
    }
    //print (task_aength) ;
    return task_all_cat;

    }
    
