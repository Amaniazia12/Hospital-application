import 'package:flutter/material.dart';

class Patient {
  int id;
  String image;
  DateTime check_in;
  DateTime check_out;
  String gender;
  int age;
  int mobile;
  String nationality;
  String user;
  int stay_room;
  //String name;
  List<int> acessed_tasks;
  //String doctorId;

  Patient({
    this.id,
    this.image,
    this.check_in,
    this.check_out,
    this.gender,
    this.age,
    this.mobile,
    this.nationality,
    this.user,
    this.stay_room,
    this.acessed_tasks,
    //this.name,
    //this.doctorId,
  });

  Patient.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    //name = json["name"];
    image = json["image"];
    check_in = json["check_in"];
    check_out = json["check_out"];
    gender = json["gender"];
    age = json["age"];
    mobile = json["mobile"];
    nationality = json["nationality"];
    user = json["user"];
    stay_room = json["stay_room"];
    acessed_tasks = json["accessd_Tasks"];
    //doctorId = json["doctorId"];
  }
}
