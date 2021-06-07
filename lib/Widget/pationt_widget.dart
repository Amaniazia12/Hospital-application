import 'package:flutter/material.dart';
import '../Screens/patientProfile_screen.dart';
import '../Models/patientClass.dart';

class pationtItem extends StatelessWidget {
  Patient patient;
  pationtItem({this.patient});

  void selectedPation(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(PationtProfile_screen.routeName, arguments: {patient});
  }

  Widget _text(String title, Color color, double fontSize, String value) {
    return Text(
      "  " + title + " : " + value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () => selectedPation(context),
        child: Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              topLeft: Radius.circular(100.0),
            ),
            color: Theme.of(context).primaryColor,
          ),
          child: Card(
            elevation: 50,
            margin: EdgeInsets.only(left: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                  ),
                  color: Theme.of(context).accentColor,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(patient.image),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        _text("", Colors.white, 18, patient.nationality),
                        SizedBox(
                          height: 25,
                        ),
                        _text(
                            "From", Colors.grey[400], 12, patient.nationality),
                        _text("Check in", Colors.grey[400], 12,
                            patient.check_in.toString()),
                        _text("Check out ", Colors.grey[400], 12,
                            patient.check_out.toString()),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
