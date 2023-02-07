import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projecttesting/settings/settings_controller.dart';
import 'package:projecttesting/settings/settings_service.dart';
import 'Pages/Authentication/RegisterPage/registerScreen.dart';
import 'Pages/Authentication/loginPage/login_screen.dart';
import 'Pages/HomePageBottomMenuBar.dart';
import 'Theme/themeProvider.dart';

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child){
        return MaterialApp(
        theme: Themes.lightTheme,
        darkTheme: Themes.datkTheme,
        themeMode: settingsController.themeMode,
    
        debugShowCheckedModeBanner: false,

        // onGenerateRoute: (RouteSettings routeSettings) {
        //     return MaterialPageRoute<void>(
        //       settings: routeSettings,
        //       builder: (BuildContext context) {
        //         switch (routeSettings.name) {
        //           default:
        //             return HomeScreen(
        //               settingsController: settingsController,
        //             );
        //         }
        //       },
        //     );
        //   },
        initialRoute: '/',
        routes: {
          '/' : (context) => HomeScreen(settingsController: settingsController,),
          //'/' : (context) => LoadingScreen(),
          //'/' : (context) => LogIn(),
          //'/' : (context) => Register(),
          // '/' : (context) => EventPage(),
          '/Homescreen' : (context) => HomeScreen(settingsController: settingsController,),
          '/login_screen' :(context) => LogIn(),
          '/Register_screen' :(context) => Register(),
          // '/ResetPasswordScreen' :(context) => ResetPassword(),
          // '/detailScreen' :(context) => BookDetail(),
        },
      );
      }
    );
  }
}

class MyCustomScrollBehaviors extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
