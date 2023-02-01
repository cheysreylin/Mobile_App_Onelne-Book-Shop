import 'package:flutter/material.dart';
import 'package:projecttesting/settings/settings_controller.dart';
import 'Pages/HomePageBottomMenuBar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        //'/' : (context) => LoadingScreen(),
        //'/' : (context) => LogIn(),
      //  '/' : (context) => Register(),
        // '/' : (context) => EventPage(),
        '/Homescreen' : (context) => HomeScreen(),
        // '/login_screen' :(context) => LogIn(),
        //'/Register_screen' :(context) => Register(),
        // '/ResetPasswordScreen' :(context) => ResetPassword(),
        // '/detailScreen' :(context) => BookDetail(),
      },
    );
  }
}
