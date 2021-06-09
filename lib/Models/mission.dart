import 'dart:convert';

class Mission {
  static List<String> _mission = new List<String>();
  List<dynamic> s;
  String taskName;
  String id;
  String start_time;
  String num_task;

  Mission({this.s, this.taskName});

  Mission.addMission(String NameTask, Map<String, String> m) {
    String s = json.encode(m);
    print(s + " taskkkkkkkk");
    _mission.add(s);
    print(_mission.length.toString() + "final mission");
  }

  Mission.submitTask() {
    //JSONObject  j = new Gson();
    String l = json.encode(_mission);
    Map<String, String> m = {
      "id": "1",
      "start_time": "6/9/2021",
      "#task": _mission.length.toString(),
      "tasks": l,
    };
    String finalMission = json.encode(m);
    print(finalMission);
  }
}
