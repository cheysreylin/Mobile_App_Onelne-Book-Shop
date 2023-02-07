import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/author.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/forYou.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/Top_Chart.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/components/loadingTopChartScreen.dart';
import 'package:projecttesting/settings/settings_controller.dart';

import '../../FiltersBook/search_loadind.dart';

class HomeMenuBar extends StatefulWidget {
  // const HomeMenuBar({super.key});
  var l;
  HomeMenuBar({Key? key, required this.settingsController, required this.l})
      : super(key: key);
  final SettingsController settingsController;

  @override
  State<HomeMenuBar> createState() => _HomeMenuBarState();
}

class _HomeMenuBarState extends State<HomeMenuBar> {
  TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      
        body:DefaultTabController(
            length: 3, 
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: new PreferredSize(
                
                preferredSize: Size.fromHeight(56.0),
                child: TabBar(
                  tabs: [
                    Tab(icon: TextButton(onPressed: (){}, child: Text("For You"))),
                    Tab(icon: TextButton(onPressed: (){}, child: Text("Top Chart")),),
                    Tab(icon: TextButton(onPressed: (){}, child: Text("Author")),),
                  ]
                ),
              ),
              body: TabBarView(
                children: [
                    ForYou(settingsController: widget.settingsController),
                    loadingscreenTopChart(l: widget.l),
                    Author(settingsController: widget.settingsController),
                ]
             ),
            )
          ),
      )
    
    );
  }
}