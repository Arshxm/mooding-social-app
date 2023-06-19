import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/activity_screen.dart';
import 'package:instagram_clone/screens/add_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBotNavPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              border: Border.all(color: Colors.black)),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: BottomNavigationBar(
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff1C1F2E),
              currentIndex: _selectedBotNavPage,
              onTap: (int index) {
                setState(() {
                  _selectedBotNavPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_home.png'),
                    activeIcon: Image.asset('images/icon_active_home.png'),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_search_navigation.png'),
                    activeIcon:
                        Image.asset('images/icon_search_navigation_active.png'),
                    label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_add_navigation.png'),
                    activeIcon:
                        Image.asset('images/icon_add_navigation_active.png'),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/icon_activity_navigation.png'),
                    activeIcon: Image.asset(
                        'images/icon_activity_navigation_active.png'),
                    label: 'Salam'),
                BottomNavigationBarItem(
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffC5C5C5),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: Image.asset('images/profile.png'),
                      ),
                    ),
                    activeIcon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xffF35383),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      width: 40,
                      height: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: Image.asset('images/profile.png'),
                      ),
                    ),
                    label: 'Salam'),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedBotNavPage,
          children: _getLayout(),
        ));
  }

  List<Widget> _getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddPostScreen(),
      ActivityScreen(),
      UserProfileScreen()
    ];
  }
}
