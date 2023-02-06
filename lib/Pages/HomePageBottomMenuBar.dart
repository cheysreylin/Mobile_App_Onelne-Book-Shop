
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/Cards/card.dart';
import 'package:projecttesting/Pages/EventsPage/eventPage.dart';
import 'package:projecttesting/Pages/HomePageComponents/HomeMenuBar.dart';
import 'package:projecttesting/Pages/ProfilesError/profile.dart';
import 'package:projecttesting/settings/settings_controller.dart';

import '../FiltersBook/search_loadind.dart';


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

    late final List<Widget> _widgetOptions = <Widget>[
      HomeMenuBar(settingsController: widget.settingsController, l: widget,),
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
      home: Container(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
        child: Scaffold(
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
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Container(
                width: double.infinity,
                child: TextField(
                  autocorrect: true,
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 236, 236),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 248, 248, 248), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        // this.setState(() {
                        //   _searchController.clear();
                        // });
                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return searchloading(text: _searchController.text);
                          }));
                      }, 
                      icon: Container(
                        margin: EdgeInsets.only(right: 9),
                        child: Icon(Icons.search)),
                    ),
                    //hintText: 'Search...',
                    label: Container(
                      margin: EdgeInsets.only(left: 9),
                      child: Text("Search here...", style: TextStyle(color: Color.fromARGB(255, 158, 157, 157)),)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none
                      ),
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
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(Icons.event),
                label: 'Event',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(Icons.favorite_outline),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(Icons.person_pin_rounded),
                label: 'Profile',
              )
            ],
            ),
          ),
      ),
      );
  }
}






