class Task {
   int id;
   String name;
   int task_type;

  Task({this.id, this.name, this.task_type});

  Task.fromJson (Map<String, dynamic> json){
    id = json["id"];
    name=json["name"];
    task_type=json["task_type"];
  }
}