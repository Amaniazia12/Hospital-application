import 'package:flutter/material.dart';
import 'package:hospital_application/API/medicineAPI.dart';
import 'package:hospital_application/Models/MedicineModel.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Models/task_categoryClass.dart';
import 'package:hospital_application/Screens/taskParameter.dart';
import 'package:hospital_application/Screens/foodScreen.dart';

class check_task {
  String taskName;
  int patientId;
  task_category categoryTask;
  check_task({this.taskName, this.categoryTask, this.patientId});

  getparameter(String taskName, int patientId, task_category categoryTask,
      BuildContext context) {
    if (taskName == "investigate crona") {
      Map<String, String> m = {
        "id_invistegation_type": "crona_investegation",
        "id_patient": patientId.toString()
      };
      Mission.addMission("investigate crona", m);
    } else if (taskName == "investigate fever") {
      Map<String, String> m = {
        "id_invistegation_type": "favor_investegation",
        "id_patient": patientId.toString()
      };
      Mission.addMission("investigate fever", m);
    } else if (taskName == "scan report (OCR)") {
      print("nn");
      Map<String, String> m = {
        "service_type": "scan_OCR",
        "id_patient": patientId.toString()
      };
      Mission.addMission("scan report (OCR)", m);
      print("22");
    } else if (taskName == "scan heart pulses") {
      Map<String, String> m = {
        "service_type": "scan_heart_pulses",
        "id_patient": patientId.toString()
      };
      Mission.addMission("scan heart pulses", m);
    } else if (taskName == "medicine recognition") {
      Navigator.of(context).pushNamed(taskParameter.routName, arguments: {
        "task": taskName,
        "patientid": patientId,
        "text": "Medicin",
      });
    } else if (taskName == "ask patient") {
      Navigator.of(context).pushNamed(taskParameter.routName, arguments: {
        "task": taskName,
        "patientid": patientId,
        "text": "questions",
      });
    } else if (taskName == "food_order") {
      Navigator.of(context).pushNamed(foodScreen.routName, arguments: {
        "task": taskName,
        "patientid": patientId,
        "text": "questions",
      });
    }
  }
}
