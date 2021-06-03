
import 'package:flutter/material.dart';

class Patient{

   int id ;
   String image ; 
   DateTime check_in;
   DateTime check_out;
   String gender;
   int age;
   int mobel;
   String nationality;
   String user;
   int stay_room;
   String name;
   List <int> acessed_tasks;
   String doctorId;
   
  Patient({
    @required this.id,
    @required this.image,
    @required this.check_in,
    @required this.check_out,
    @required this.gender,
    @required this.age,
    @required this.mobel,
    @required this.nationality,
    @required this.user,
    @required this.stay_room,
    @required this.acessed_tasks,
    @required this.name,
    @required this.doctorId,
  });

Patient.fromjson(Map <String , dynamic> json){
  id =json["id"];
  name = json["image"];
  check_in=json["check_in"];
  check_out=json["check_out"];
  gender=json["gender"];
  age=json["age"];
  mobel=json["mobel"];
  nationality=json["nationality"];
  user=json["user"];
  stay_room=json["user"];
  acessed_tasks=json["accessd_Tasks"];
}

}