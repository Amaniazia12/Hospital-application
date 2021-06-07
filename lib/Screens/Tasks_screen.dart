import 'package:flutter/material.dart';
import 'package:hospital_application/API/task_api.dart';
import 'package:hospital_application/Models/Task_Model.dart';

import '../API/task_api.dart';

class taskScreen extends StatefulWidget {
  static String routName = 'taskScreen';
  String idCategory ;
  taskScreen({this.idCategory});
  
  
  @override
  _taskScreenState createState() => _taskScreenState();
}

 
class _taskScreenState extends State<taskScreen> {
  List<Task> getTaskall (){
       FutureBuilder(
           future: getTask(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.data == null) 
                return null;
              else 
                return snapshot.data;
                }
           );
   } 
  var allTaskscateg;
  @override 
  void initState() {
    
    super.initState();
    allTaskscateg= getTaskall();
  }

  @override
  Widget build(BuildContext context) {
   String idCategory = ModalRoute.of(context).settings.arguments as String ;
   final categoryTasks= allTaskscateg.where((task){
      return task.type = idCategory ;
    } ).toList();   
    
     return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        child:ListView.builder(
                  itemCount: categoryTasks.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height:MediaQuery.of(context).size.width*0.15 ,
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
                          child: Text(categoryTasks.data[index].name,),
                          onTap: () {
                            // Navigator.pushNamed(context, 'LoginSuccessScreen');
                          },
                        ),
                      ),
                    );
                  }
      ),
     )
    );
  }
}
