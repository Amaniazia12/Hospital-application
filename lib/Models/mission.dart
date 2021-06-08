import 'dart:convert';

class Mission {
  static List<String> _mission = new List<String>();
  List<dynamic> s;
  String taskName;

  Mission({this.s, this.taskName});

  Mission.addMission(String NameTask, Map<String, String> m) {
    String s = json.encode(m);
    print(s + " taskkkkkkkk");
    _mission.add(s);
    print(_mission.length.toString() + "final mission");
  }
}
