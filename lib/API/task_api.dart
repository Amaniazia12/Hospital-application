import 'dart:io';
import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Task>> getTask() async {
  final taskData = await http
      .get(Uri.parse("http://172.16.46.46:8000/Tasks/TaskAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(taskData.body);
  List<Task> task_all = [];

  for (var task in jsonData) {
    task_all.add(Task.fromJson(task));
  }
  return task_all;
}
