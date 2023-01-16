
import 'package:flutter/material.dart';
import 'package:projecttesting/login_page/login_screen.dart';
import 'package:projecttesting/utils/constants.dart';
import 'home_screen/HomeScreen.dart';
import 'loading_screen/LoadingScreen.dart';
import 'login_page/login_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        // '/HomeScreen' : (context) => HomeScreen(),
        // '/login_screen' :(context) => LoginScreen(),
      },
    );
  }
}
