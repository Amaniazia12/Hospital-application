import 'package:flutter/material.dart';
import 'package:hospital_application/API/task_category.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';

class get_category_widget extends StatelessWidget {
  // const get_category_widget({ Key? key }) : super(key: key);

  List<task_category> task_all = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getTaskCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.data;
            }));
  }
}
