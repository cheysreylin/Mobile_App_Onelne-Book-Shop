
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/EventsPage/eventPage.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/author.dart';
import 'package:projecttesting/Pages/RegisterPage/registerScreen.dart';
import 'package:projecttesting/Pages/ResetPassword/resetPassword.dart';
import 'package:projecttesting/Pages/loginPage/login_screen.dart';
import 'package:projecttesting/utils/constants.dart';
// import 'Pages/login_page/loading_screen/LoadingScreen.dart';
import 'Pages/HomePageBottomMenuBar.dart';
import 'Pages/loginPage/login_screen.dart';

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
        //'/' : (context) => LoadingScreen(),
        // '/' : (context) => LogIn(),
        //'/' : (context) => Register(),
        // '/' : (context) => EventPage(),
        // '/HomeScreen' : (context) => HomeScreen(),
        // '/login_screen' :(context) => LogIn(),
        // '/Register_screen' :(context) => Register(),
        // '/ResetPasswordScreen' :(context) => ResetPassword(),
      },
    );
  }
}
