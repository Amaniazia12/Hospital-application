import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widget/gridOfHome_widget.dart';
class Home_screen extends StatefulWidget {
  static const routName='/Home_Screen';
  @override
  Home_screenState createState() => new Home_screenState();
}
class Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: <Widget>[
          SizedBox(height: 110),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4),
                    /*Text(
                      "Home",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),*/
                   // ),
                  ],
                ),
                /*IconButton(
                  onPressed: () {},
                  alignment: Alignment.topCenter,
                  icon: Image.asset("images/notification.png", width: 24),
                )*/
              ],
            ),
          ),
          SizedBox(height: 40),
          //TODO Grid Dashboard
          GridDashboard(),
        ],
      ),
    );
  }
}