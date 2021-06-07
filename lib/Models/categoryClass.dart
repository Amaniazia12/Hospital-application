class task_category {
  int id;
  String name;
  String description;

  task_category({this.id, this.name, this.description});

  task_category.fromJson (Map<String, dynamic> json){
    id = json["id"];
    name=json["name"];
    description=json["description"];
  }
}