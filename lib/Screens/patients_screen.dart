import 'package:flutter/material.dart';
import '../Widget/pationt_widget.dart';
import 'dart:io';
import '../Models/patientClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../API/patient_api.dart';

class PationtScreen extends StatelessWidget {
  static const routName = '/pationtScreen';

  /*
                    return  pationtItem(
                        patient: snapshot.data[index],
                      );
                      */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patients"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        child: FutureBuilder(
            future: gitAllPatients(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue[50],
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: GestureDetector(
                          //width: MediaQuery.of(context).size.width*0.85,
                          child: Text(
                            snapshot.data[index].gender,
                          ),
                          onTap: () {
                            // Navigator.pushNamed(context, 'LoginSuccessScreen');
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
