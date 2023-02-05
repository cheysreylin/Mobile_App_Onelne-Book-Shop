import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/author.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/forYou.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/Top_Chart.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/components/loadingTopChartScreen.dart';
import 'package:projecttesting/settings/settings_controller.dart';

class HomeMenuBar extends StatelessWidget {
  // const HomeMenuBar({super.key});
  var l;
  HomeMenuBar({Key? key, required this.settingsController, required this.l})
      : super(key: key);
  final SettingsController settingsController;
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    ForYou(settingsController: settingsController),
                    loadingscreenTopChart(l: l),
                    Author(settingsController: settingsController),
                ]
             ),
            )
          ),
      )
    
    );
  }
}