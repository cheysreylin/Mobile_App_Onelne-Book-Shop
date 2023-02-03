import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/author.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/customappbar.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/forYou.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/topChart.dart';
import 'package:projecttesting/settings/settings_controller.dart';

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});
  // const HomeMenuBar({Key? key, required this.settingsController})
  //     : super(key: key);
  // final SettingsController settingsController;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body:DefaultTabController(
            length: 3, 
            child: Scaffold(
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
                    ForYou(),
                    const TopChart(),
                    const Author(),
                ]
             ),
            )
          ),
      )
    
    );
  }
}