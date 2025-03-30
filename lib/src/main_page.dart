import 'package:brandie_assignment/src/pages/home/home_page.dart';
import 'package:brandie_assignment/src/pages/messages/message_page.dart';
import 'package:brandie_assignment/src/pages/profile/profile_page.dart';
import 'package:brandie_assignment/src/pages/boost/boost_page.dart';
import 'package:brandie_assignment/src/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The first screen in the application
/// Acts as a Dashboard page
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // variable to change page, initially 2 as home page button is in second index
  int _currentIndex = 2;

  // Pages list to navigate using bottom navigation bar
  final _navPages = [
    BoostPage(),
    SearchPage(),
    HomePage(),
    MessagePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _navPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/rocket.svg'),
              label: 'rocket'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/search.svg'),
              label: 'search'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'), label: 'home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/message.svg'),
              label: 'message'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              label: 'profile'),
        ],
      ),
    );
  }
}
