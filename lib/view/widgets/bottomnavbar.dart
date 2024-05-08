import 'package:flutter/material.dart';
import 'package:insta_clone_test_1/view/screens/home_screen.dart';
import 'package:insta_clone_test_1/view/screens/post_screen.dart';
import 'package:insta_clone_test_1/view/screens/profile_screen.dart';
import 'package:insta_clone_test_1/view/screens/users_screen.dart';
import 'package:insta_clone_test_1/view/screens/search_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentindex = 0;

  List screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const UsersScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentindex,
          onTap: (newindex) {
            setState(() {
              _currentindex = newindex;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black87,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'searcch',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'users',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'profile',
            ),
          ]),
    );
  }
}
