import 'package:flutter/material.dart';

class Doctor{

   String id ;
   String name;
   String image;
   String user;
   String department;
   List <String >acessed_taskesg;


   Doctor({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.user,
    @required this.department,
    @required this.acessed_taskesg,
  });

}