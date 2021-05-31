import 'package:flutter/material.dart';

class Doctor{

  final String id ;
  final String name;
  final String image;
  final String user;
  final String department;
  final List <String >acessed_taskesg;


  const Doctor({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.user,
    @required this.department,
    @required this.acessed_taskesg,
  });

}