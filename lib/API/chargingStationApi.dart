import 'dart:io';
import 'package:hospital_application/Models/chargingStationModel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<chargingStation>> getChargingStation() async {
  final Dataa = await http.get(
      Uri.parse("http://192.168.1.4:8000/Places/ChargingStationAPI/"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
      });
  var jsonData = json.decode(Dataa.body);
  List<chargingStation> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(chargingStation.fromJson(t));
  }
  return ch_all;
}
