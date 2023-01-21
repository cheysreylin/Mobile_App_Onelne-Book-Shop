import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/Cards/card.dart';
import 'package:projecttesting/Pages/EventsPage/eventPage.dart';
import 'package:projecttesting/Pages/HomePageComponents/HomeMenuBar.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/author.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/forYou.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/topChart.dart';
import 'package:projecttesting/Pages/Profiles/profile.dart';
import 'package:projecttesting/provider/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int _selectedIndex = 0;
    final ScrollController _HomePageController = ScrollController();

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    static const List<Widget> _widgetOptions = <Widget>[
    HomeMenuBar(),
    EventPage(),
    CardPage(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  iconColor: Colors.grey,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: (){}, 
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
              icon: Icon(Icons.camera), color: Colors.grey,)
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
