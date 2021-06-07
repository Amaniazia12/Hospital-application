import 'package:flutter/material.dart';
import 'package:hospital_application/API/task_api.dart';

class get_task_widget extends StatelessWidget {
  //const det_task_widget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getTask(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.data;
            }));
  }
}
