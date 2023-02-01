import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projecttesting/Pages/DetailPage/detail.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/bestAuthor.dart';
import 'package:projecttesting/model/api.dart';
import '../../../../../../settings/settings_controller.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:projecttesting/model/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projecttesting/Pages/DetailPage/detail.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/bestAuthor.dart';

class MovieHeader extends StatefulWidget {
  final List<Books> bookHeaderList = book_list;
  @override
  State<MovieHeader> createState() => _MovieHeaderState();
}

class _MovieHeaderState extends State<MovieHeader> {
  final _pageController = PageController(viewportFraction: 1, keepPage: true);

  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < widget.bookHeaderList.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: _size.width > 900 ? 280 : 120,
      width: double.infinity,
      child: Stack(
        children: [
          PageView(
              controller: _pageController,
              children: widget.bookHeaderList
                  .map((e) => GestureDetector(
                        // onTap: () => Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPage(
                        //       settingsController: widget.settingsController,
                        //       books: e,
                        //     ),
                        //   ),
                        // ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                                width: double.infinity,
                                margin:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Hero(
                                    tag: e,
                                    child: Image.asset(
                                      e.image, 
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black, Colors.transparent],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.book_title.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                    Text(
                                      e.description.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList()),
          Positioned(
              bottom: 15,
              left: 50,
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  _pageController.animateToPage(index,
                      duration: const Duration(microseconds: 300),
                      curve: Curves.easeInOut);
                },
                controller: _pageController,
                count: widget.bookHeaderList.length,
                effect: const ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotWidth: 8,
                    dotHeight: 8,
                    spacing: 4,
                    activeDotColor: Colors.white),
              ))
        ],
      ),
    );
  }
}
