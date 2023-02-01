
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/Cards/card.dart';
import 'package:projecttesting/Pages/EventsPage/eventPage.dart';
import 'package:projecttesting/Pages/HomePageComponents/HomeMenuBar.dart';
import 'package:projecttesting/settings/settings_controller.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
      // UserProfile()
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

    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
      ? "DarkTheme"
      : "LightTheme";

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false, 
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            title: Container(
              width: double.infinity,
              // height:15,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238), borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  iconColor: Colors.grey,
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
                  border: InputBorder.none
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){
                
              }, 
              icon: Icon(Icons.light_mode), color: Colors.grey,)
            ],
          ),
          body: Center(
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
        )
      );
  }
}
