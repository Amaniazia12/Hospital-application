import 'dart:io';
import '../Models/patientClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Patient>> gitAllPatients() async {
  final patientData = await http.get(
      Uri.parse("https://robohub.pythonanywhere.com/Person/PatientAPI/"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "token b194bda7a92bc7000d569b830a565a89a2b66993"
      });
  var jsonData = json.decode(patientData.body);
  List<Patient> allPatient = [];
  for (var patient in jsonData) {
    allPatient.add(Patient.fromjson(patient));
  }

  return allPatient;
}
