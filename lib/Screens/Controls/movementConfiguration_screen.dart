import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovementConfigration_screen extends StatefulWidget {

  static final  routName = 'MovementConfigration_screen' ;
  final List<double>  minList ;
  final List<double> maxList;
  
  MovementConfigration_screen({this.minList,  this.maxList });

  @override
  _myhomeState createState() => _myhomeState();
}

class _myhomeState extends State<MovementConfigration_screen> {
  
  final movControll = TextEditingController();
  
  static List<TextEditingController> ValControll = List.generate(10, (i) => TextEditingController()) ;
   int indexControl=0 ;
   
   static List<double> val =[10,20,30,40,50] ;
   
   bool putValue = false;
  @override
  void initState() {
      // TODO: implement initState
      for (int i = 0 ; i < 5 ; i ++){
        print("dddddddddddd"+ widget.minList[i].toString());
       // val[i]= 10;
        print("dddddddddddd"+ val[i].toString());

      }
          super.initState();
  }
  void submitLimits() {
    /*final value = double.parse(ValControll[indexControl].text);

    if ( value < 0 ) {
      return;
    }
    */
    setState(() {
      //val[indexControl]=double.parse(ValControll[indexControl].text);
      //indexControl++;
     for (int i = 0 ; i < 5 ; i ++){
       val[i]= double.parse(ValControll[i].text);
       if (val[i]<0)
          continue; 
       print("val " + i.toString()+" : "+ ValControll[i].toString());
    } 
    });
  }

  value_movment()
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          
          Container(
            width: 150,
            child: TextField(
              decoration: InputDecoration(labelText:"movement name"),
              keyboardType: TextInputType.number,
              controller: movControll,
            ),),
        ],),);
  }

  Items(int index)
  {
    return Container(
        height: MediaQuery.of(context).size.height*0.15,
        width: MediaQuery.of(context).size.width,
      child: new Column(
          children:<Widget>[
          valuetheta(index),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("  min : "+widget.minList[index].toString(), style: TextStyle(fontSize: 10,),),

                  Expanded(
                    child: Slider(
                      max:widget.maxList[index],
                      min: widget.minList[index],
                      value: val[index],
                      label: val[index].round().toString(),
                      activeColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey,
                      onChanged: (double newval)
                      {
                        setState(() {
                          val[index] = newval.roundToDouble()  ;
                          ValControll[index].text=newval.toString();
                        });
                      },
                    ),
                  ),
                   Text("max : "+widget.maxList[index].toString() , style: TextStyle(fontSize: 10,),),
                ],
              ),
            ),

        ],
      ),
    );
  }

   valuetheta(int index)
  {
    return Container(
      padding: const EdgeInsets.all(2.0),
      height: MediaQuery.of(context).size.height*0.05,
      width: MediaQuery.of(context).size.width,
      child: new Row(
        children:<Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row (
              children: [
              Container(
              child:Image.asset("assets/images/pngegg.png")
              ),
              Text(" "+(index+1).toString()),
              ]
            ),
        ),
       Container(
         padding: EdgeInsets.all(4),
         decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0)),
              color: Colors.grey[200]),
         width:100,
         child: TextField(
          decoration: InputDecoration(labelText: ""),
          keyboardType: TextInputType.number,
          controller: ValControll[index] ,
          onSubmitted: (_) => submitLimits(),
  ),
  ),
  ],
  ),
  );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:Text("Monvment configuration",style: TextStyle(color: Colors.white),)),
      body: SingleChildScrollView (
      child:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
          Container(
            child: new Column(
                children: <Widget>[
                  value_movment(),
                  ListView .builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx,index){return Items(index);},
                    itemCount: 5,
                  )
                ]
            ),
          )
      ),
    )
    );
  }
}