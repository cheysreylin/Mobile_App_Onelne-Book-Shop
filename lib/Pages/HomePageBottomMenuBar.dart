
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/Favourite/FavouriteCard.dart';
import 'package:projecttesting/Pages/EventsPage/eventPage.dart';
import 'package:projecttesting/Pages/HomePageComponents/HomeMenuBar.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/horrorPopular.dart';
import 'package:projecttesting/Pages/UserProfile/userProfile.dart';
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
                label: 'Events',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Icon(Icons.card_giftcard),
                label: 'Card',
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






