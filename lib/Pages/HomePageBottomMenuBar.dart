import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/Cards/card.dart';
import 'package:projecttesting/Pages/EventsPage/eventPage.dart';
import 'package:projecttesting/Pages/HomePageComponents/HomeMenuBar.dart';
import 'package:projecttesting/Pages/ProfilesError/profile.dart';
import 'package:projecttesting/settings/settings_controller.dart';


class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});
  const HomeScreen({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    int _selectedIndex = 0;
    final ScrollController _HomePageController = ScrollController();
    TextEditingController _searchController = TextEditingController();

    static const List<Widget> _widgetOptions = <Widget>[
      HomeMenuBar(),
      EventPage(),
      CardPage(),
      UserProfile()
    ];
      
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    @override
    void dispose() {
     _searchController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false, 
        //  appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 235, 235, 235),
          
          //   iconTheme: IconThemeData(color: Color.fromARGB(255, 68, 68, 68)),
          //   //backgroundColor: Color.fromARGB(255, 255, 255, 255),
          //   elevation: 0,
          //   title: TextField(
          //     controller: _searchController,
          //     decoration: InputDecoration(
          //       // fill
          //       // fillColor: Theme.of(context).colorScheme.seconed: true,dary,
          //       //iconColor: Color.fromARGB(255, 219, 42, 42),
                
          //       prefixIcon: const Icon(Icons.search),
          //       suffixIcon: IconButton(
          //         onPressed: (){
          //           this.setState(() {
          //             _searchController.clear();
          //           });
          //         }, 
          //         icon: Icon(Icons.clear),
          //       ),
          //       hintText: 'Search...',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(35),
          //         borderSide: BorderSide.none),
          //       ),
          //   ),
          //   actions: 
          //     [
          //       IconButton(
          //         onPressed: () {
          //           widget.settingsController.updateThemeMode(
          //               widget.settingsController.themeMode == ThemeMode.light
          //                   ? ThemeMode.dark
          //                   : ThemeMode.light);
          //         },
          //         icon: Icon(widget.settingsController.themeMode == ThemeMode.light
          //             ? Icons.dark_mode_rounded
          //             : Icons.light_mode_rounded),
          //       )
          //     ]
          //  ),         
         appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 228, 172, 172),
            elevation: 0,
            title: Container(
              width: double.infinity,
              // height:15,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255), 
                //borderRadius: BorderRadius.circular(65),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  //iconColor: Color.fromARGB(255, 219, 42, 42),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: (){
                      this.setState(() {
                        _searchController.clear();
                      });
                    }, 
                    icon: Icon(Icons.clear),
                  ),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35),
                    borderSide: BorderSide.none),
                  ),
              ),
            ),
            actions: 
            [
              IconButton(
                onPressed: () {
                  widget.settingsController.updateThemeMode(
                      widget.settingsController.themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light);
                },
                icon: Icon(widget.settingsController.themeMode == ThemeMode.light
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded),
              )
            ]
          ),
        
        body: Container(

            child: _widgetOptions.elementAt(_selectedIndex),
        ),

        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Color.fromARGB(255, 17, 46, 212),
          iconSize: 25,
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          unselectedItemColor: Color.fromARGB(255, 116, 116, 116),
          onTap: _onItemTapped,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Profile',
            )
          ],
          ),
        ),
      );
  }
}





