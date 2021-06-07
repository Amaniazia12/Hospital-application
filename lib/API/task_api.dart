import 'dart:io';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Task>> getTask() async {
  final taskData = await http.get(
      Uri.parse("https://robohub.pythonanywhere.com/Tasks/TaskAPI/"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "token b194bda7a92bc7000d569b830a565a89a2b66993"
      });
  var jsonData = json.decode(taskData.body);
  List<Task> task_all = [];

  for (var task in jsonData) {
    task_all.add(Task.fromJson(task));
  }
  return task_all;
}
