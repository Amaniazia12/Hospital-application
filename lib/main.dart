import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_application/API/login_api.dart';
import 'package:hospital_application/Screens/Controls/movementAction.dart';
import 'package:hospital_application/Screens/Controls/movementConfiguration_screen.dart';
import 'package:hospital_application/Screens/Controls/setting_screen.dart';
import './Screens/Controls/paint.dart';
import 'package:hospital_application/Screens/Controls/Joystick_screen.dart';
import 'package:hospital_application/Screens/LoginSuccessScreen.dart';
import 'package:hospital_application/Screens/Slider_screen.dart';
import 'package:hospital_application/Screens/Tasks_screen.dart';
import './Screens/home-screen.dart';
import 'package:hospital_application/Screens/sign_up.dart';
import 'package:hospital_application/blocs/auth_bloc.dart';
import 'package:hospital_application/blocs/auth_state.dart';
import 'Screens/Patient/patientProfile_screen.dart';
import 'Screens/Patient/patients_screen.dart';
import './Screens/Controls/controlSliders_widgit.dart';
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
    
    super.initState();
  }
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(loginInitState(), Login_Api()))
        ],
        
        child: MaterialApp(
                theme: ThemeData(
                  primaryColor: Colors.blue[200],
                  accentColor: Colors.blue[100],
                ),
                home:AnimatedSplashScreen(
                  splash: ('assets/images/robpng.png'),
                  backgroundColor: Colors.blue[200],
                  nextScreen:  Joystick_screen(),
                ),
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
              slider.routName: (ctx) => slider(),
              taskScreen.routName: (ctx) => taskScreen(),
              LoginSuccessScreen.routName: (ctx) => LoginSuccessScreen(),
              sign_up.routName: (ctx) => sign_up(),
              PationtScreen.routName:(ctx)=>PationtScreen(),
              PationtProfile_screen.routeName:(ctx)=>PationtProfile_screen(),
              Home_screen.routName:(ctx) => Home_screen(),
              Joystick_screen.routeName:(ctx)=>Joystick_screen(),
              Setting_Screen.routeName:(ctx)=>Setting_Screen(),
              MovementConfigration_screen.routName:(ctx)=>MovementConfigration_screen(),
              MovementAction.routName:(ctx)=>MovementAction(),
            }));
  }
}
