import 'package:flutter/material.dart';
import 'package:hospital_application/API/task_api.dart';

class taskScreen extends StatefulWidget {
  const taskScreen({Key key}) : super(key: key);
  static String routName = 'taskScreen';
  @override
  _taskScreenState createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Container(
        child: FutureBuilder(
            future: getTask(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
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
                          child: Text(snapshot.data[index].name,),
                          onTap: () {
                            // Navigator.pushNamed(context, 'LoginSuccessScreen');
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
