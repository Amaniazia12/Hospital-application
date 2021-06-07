import 'package:flutter/material.dart';
import 'package:hospital_application/Screens/Tasks_screen.dart';
import '../API/CategoryApi.dart';
class CategoriesOfTask extends StatelessWidget {
  static const routName = "/ categioryOfTasks";
  
  void selectedCategories( BuildContext ctx , String id ){
   Navigator.of(ctx).pushNamed(
     taskScreen.routName ,
     arguments:{
       id
       }
   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
          child: FutureBuilder(
            future: getCategory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return 
                      InkWell(
                        onTap: ()=>selectedCategories(context , snapshot.data[index].id.toString()),
                        child: 
                        Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                                borderRadius: 
                                BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  topLeft: Radius.circular(100.0),),
                                color: Theme.of(context).primaryColor,),
                          child: 
                          Card(
                            elevation: 50,
                            margin: EdgeInsets.only(left:15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                            child: Text(snapshot.data[index].name +" task "),
                            ),
                            )
                            );
                  }
                );
              }
            }
          ),
          
        ),
        )
      )
      );
  }
}