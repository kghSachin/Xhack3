import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/auth/pages/map_page.dart';
import 'package:frontend/features/chat/chat_page.dart';
import 'package:frontend/features/chat/constants.dart';
import 'package:frontend/features/maps/google_map.dart';
import 'package:frontend/features/tutor/tutor.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: PersistentTabView(
      decoration: NavBarDecoration(
        border: BorderDirectional(
          top: BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
      backgroundColor: scaffoldBackgroundColor,
      context,
      screens: [
        Container(
          color: Colors.red,
        ),
        GoogleMapsView(),
        ChatScreen(),
        TutorPage(),
        Container(
          color: Colors.purple,
        ),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.map),
          title: ("map"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.chat),
          title: ("chatbot"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.assist_walker),
          title: ("tutor"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("profile"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
    ));
  }
}
