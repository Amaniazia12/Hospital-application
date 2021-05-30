import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/login_api.dart';
import 'package:hospital_application/Screens/LoginSuccessScreen.dart';
import 'package:hospital_application/Screens/Slider_screen.dart';
import 'package:hospital_application/Screens/sign_up.dart';
import 'package:hospital_application/blocs/auth_bloc.dart';
import 'package:hospital_application/blocs/auth_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(loginInitState(), Login_Api()))
        ],
        child: MaterialApp(
          /**
            home: Container(
                child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background44.jpg'),
                          fit: BoxFit.fill)),
                ),
    **/
                home:AnimatedSplashScreen(
                  splash: ('assets/images/robpng.png'),
                  backgroundColor: Colors.blue[200],
                  nextScreen: slider(),
                ),
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
              slider.routName: (ctx) => slider(),
              LoginSuccessScreen.routName: (ctx) => LoginSuccessScreen(),
              sign_up.routName: (ctx) => sign_up(),
            }));
  }
}
