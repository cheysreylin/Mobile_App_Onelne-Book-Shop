
import 'package:flutter/material.dart';
import 'package:projecttesting/EventsPage/eventPage.dart';
import 'package:projecttesting/home_screen/Components/Author/author.dart';
import 'package:projecttesting/login_page/login_screen.dart';
import 'package:projecttesting/utils/constants.dart';
import 'loading_screen/LoadingScreen.dart';
import 'home_screen/HomePage.dart';
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
        // '/' : (context) => Author(),
        // '/' : (context) => LoadingScreen(),
        // '/' : (context) => HomeScreen(),
        // '/' : (context) => EventPage(),
        '/HomeScreen' : (context) => HomeScreen(),
        // '/login_screen' :(context) => LoginScreen(),
      },
    );
  }
}
