import 'package:flutter/material.dart';
import '../Widget/pationt_widget.dart';
import 'dart:io';
import '../Models/patientClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future <List <Patient>> _gitAllPatients() async {
 final patientData = await http.get(Uri.parse("https://robohub.pythonanywhere.com/Person/PatientAPI/"),
                                    headers: {HttpHeaders.contentTypeHeader:"application/json",HttpHeaders.authorizationHeader: "token b194bda7a92bc7000d569b830a565a89a2b66993"} );
  var jsonData = json.decode(patientData.body);
  List <Patient> allPatient;
  for (var patient in jsonData){
    allPatient.add(patient);
  }
  return allPatient ;
}

 Future  <List <Patient>> allPatient=_gitAllPatients();

class PationtScreen extends StatelessWidget {
  static const routName='/pationtScreen';

  @override
  Widget build(BuildContext context) {
    /*
    final doctorId = ModalRoute.of(context).settings.arguments as String ;
    final snapshot.data = DummyDataOfPatient.where((pationt) {
          return pationt.doctorId==doctorId;
    }).toList();
    */
    return Scaffold(
      appBar: AppBar(
        title: Text(" Patiens ")
      ),
      body: Container(
        child: FutureBuilder(
            future: allPatient,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );} 
       else {
        return ListView.builder(
          itemBuilder: (ctx,index) {
          return pationtItem (
            id: snapshot.data[index].id,
            image: snapshot.data[index].image,
            check_in: snapshot.data[index].check_in,
            check_out: snapshot.data[index].check_out,
            gender: snapshot.data[index].gender,
            age: snapshot.data[index].age,
            mobel: snapshot.data[index].mobel,
            nationality: snapshot.data[index].nationality,
            stay_room: snapshot.data[index].stay_room,
            acessed_tasks: snapshot.data[index].acessed_tasks,
            name: snapshot.data[index].name,
            user: snapshot.data[index].user,
            allPatient: allPatient,
            //doctorId: doctorId,
             );
           },
           itemCount: snapshot.data.length,
         );
        }
       }
      ),
     )
    );
  }
 }
