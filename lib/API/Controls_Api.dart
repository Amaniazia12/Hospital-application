import 'dart:io';

import 'package:hospital_application/Models/Task_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/categoryClass.dart';



String url = 'http://192.168.0.107:8000/Tasks/SendMotion/';
sendDirections(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }
   
lefthalfarm(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }
righthalfarm(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }

leftarmX(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }
leftarmy(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }
righarmX(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }
righarmY(String eventStr) async {
    final response = await http.post(
        Uri.parse(url),
        body: {'direction': eventStr },
        headers: {});
   }



   //Camera 
   void cameraMotion()async{
     final response = await http.post(
        Uri.parse(url),
        body: {'Right': "1" },
        headers: {});
   }

   //Head 
   
    //Left
     void leftHeadMotion()async{
     final response = await http.post(
        Uri.parse(url),
        body: {'leftHeadMotion': "1" },
        headers: {});
   }

    //Right 
   void rightHeadMotion()async{
     final response = await http.post(
        Uri.parse(url),
        body: {'rightHeadMotion': "2" },
        headers: {});
   }

   //mouth 
   void mouthMotion( bool value )async{
     final response = await http.post(
        Uri.parse(url),
        body: {'Mouth': value.toString() },
        headers: {});
   }




   //Hand 
    //left
     void leftHandClose( bool value )async{
     final response = await http.post(
        Uri.parse(url),
        body: {'leftHandMotion': value.toString() },
        headers: {});
     }
    //right
     void rightHandClose( bool value )async{
     final response = await http.post(
        Uri.parse(url),
        body: {'RightHandMotion': value.toString() },
        headers: {});
     }
   