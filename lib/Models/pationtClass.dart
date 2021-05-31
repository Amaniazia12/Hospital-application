import 'package:flutter/material.dart';

class Pationt{

  final String id ;
  final String image ; 
  final String check_in;
  final String check_out;
  final String gender;
  final String age;
  final String mobel;
  final String nationality;
  final String user;
  final String stay_room;
  final String name;
  final List <String> acessed_tasks;
  final String doctorId;

  const Pationt({
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
}