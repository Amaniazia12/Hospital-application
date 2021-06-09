import 'dart:io';
import 'package:hospital_application/Models/roomModel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hospital_application/Models/RopotModel.dart';

Future<List<Ropot>> getRopot() async {
  final Dataa = await http
      .get(Uri.parse("http://192.168.1.4:8000/Items/RobotAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(Dataa.body);
  List<Ropot> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(Ropot.fromJson(t));
  }
  return ch_all;
}
