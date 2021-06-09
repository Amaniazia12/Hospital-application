import 'package:flutter/material.dart';
import 'package:hospital_application/API/RopotAPI.dart';
import 'package:hospital_application/API/chargingStationApi.dart';
import 'package:hospital_application/Models/RopotModel.dart';
import 'package:hospital_application/Models/chargingStationModel.dart';
import 'package:hospital_application/Models/mission.dart';
import 'package:hospital_application/Widget/gradient_Button.dart';

class chargingScreen extends StatefulWidget {
  //const chargingScreen({ Key? key }) : super(key: key);

  static String routName = '/chargingScreen';
  @override
  _chargingScreenState createState() => _chargingScreenState();
}

class _chargingScreenState extends State<chargingScreen> {
  List<Ropot> robot = new List();
  List<chargingStation> charging = new List();
  String valueChoose;
  @override
  initState() {
    getRopot().then((result) {
      setState(() => robot = result);
    });

    getChargingStation().then((result) {
      setState(() => charging = result);
    });
    super.initState();
  }

  dropButton(List item) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        hint: Text("selectItem"),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Colors.black, fontSize: 22),
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Robot Charging"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            child: Text(robot[0].status),
          ),
          dropButton(charging),
          SizedBox(height: 120),
          //Text(valueChoose),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: GestureDetector(
                //width: MediaQuery.of(context).size.width*0.85,
                child: gradient_button("Send Task"),
                onTap: () {
                  Map<String, String> m = {
                    "charging_action": "go_to_charging_station",
                    "ID_robot": robot[0].id.toString(),
                    "ID_station": valueChoose,
                  };
                  Mission.addMission("go to charging station", m);
                  Navigator.of(context).pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
