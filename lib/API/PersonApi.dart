import 'dart:io';
import 'package:hospital_application/Models/PersonModels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Person>> getPerson() async {
  final Dataa = await http
      .get(Uri.parse("http://192.168.1.4:8000/Person/PersonAPI/"), headers: {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
        "token 078ca49c2b99b14952f94ab07bd683b5d18ff0cf"
  });
  var jsonData = json.decode(Dataa.body);
  List<Person> ch_all = [];

  for (var t in jsonData) {
    ch_all.add(Person.fromJson(t));
  }
  return ch_all;
}
