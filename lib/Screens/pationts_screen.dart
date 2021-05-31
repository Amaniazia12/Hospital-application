import 'package:flutter/material.dart';
import '../Models/dummyData.dart';
import '../Widget/pationt_widget.dart';
class PationtScreen extends StatelessWidget {
  static const routName='/pationtScreen';

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context).settings.arguments as String ;
    final pationsOfDoctor = DummyDataOfPationt.where((pationt) {
          return pationt.doctorId==doctorId;
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(" Patiens ")
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index) {
          return pationtItem (
            id: pationsOfDoctor[index].id,
            image: pationsOfDoctor[index].image,
            check_in: pationsOfDoctor[index].check_in,
            check_out: pationsOfDoctor[index].check_out,
            gender: pationsOfDoctor[index].gender,
            age: pationsOfDoctor[index].age,
            mobel: pationsOfDoctor[index].mobel,
            nationality: pationsOfDoctor[index].nationality,
            stay_room: pationsOfDoctor[index].stay_room,
            acessed_tasks: pationsOfDoctor[index].acessed_tasks,
            name: pationsOfDoctor[index].name,
            user: pationsOfDoctor[index].user,
            doctorId: doctorId,
         );
        },
        itemCount: pationsOfDoctor.length,
      ),
    );
  }
}
