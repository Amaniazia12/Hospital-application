import 'package:flutter/material.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';

class foodScreen extends StatefulWidget {
  // const foodScreen({ Key? key }) : super(key: key);

  static String routName = '/foodScreen';
  @override
  _foodScreenState createState() => _foodScreenState();
}

class _foodScreenState extends State<foodScreen> {
  String valchange1;
  String valchange2;
  List food_type = new List();
  List itemFood = new List();

  @override
  initState() {
    //getFood().then((result) {
    //setState(() => itemFood = result);
    // });
    food_type = ["snakes", "brekfast", "lunch", "dinner"];
    itemFood = ["meat", "chicken"];
    super.initState();
  }

  dropButton(List item, String s) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        hint: Text("select Item"),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Colors.black, fontSize: 22),
        value: s == "type" ? valchange1 : valchange2,
        onChanged: (newValue) {
          setState(() {
            // String newValue;
            s == "type" ? valchange1 = newValue : valchange2 = newValue;
          });
        },
        items: item.map((valItem) {
          return DropdownMenuItem(child: Text(valItem), value: valItem);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final value =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          title: Text(value["task"]),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 90),
            dropButton(food_type, "type"), //val1
            SizedBox(height: 50),
            dropButton(itemFood, "item"), // val2
            //Text(valueChoose)
            SizedBox(height: 110),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: GestureDetector(
                  //width: MediaQuery.of(context).size.width*0.85,
                  child: gradient_button("Send Task"),
                  onTap: () {
                    Map<String, String> m = {
                      "ID_food_type": valchange1,
                      "list_of_item": valchange2,
                      "ID_patient": value["patientid"].toString(),
                    };
                    Mission.addMission("food_order", m);
                    Navigator.of(context).pop(context);
                  }),
            ),
          ],
        ));
  }
}
