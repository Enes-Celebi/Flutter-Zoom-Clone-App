import "package:flutter/material.dart";
import "package:zoom_clone_app/screens/history_meeting_screen.dart";
import "package:zoom_clone_app/screens/meetings_screen.dart";
import "package:zoom_clone_app/utils/colors.dart";
import "package:zoom_clone_app/widgets/home_meeting_button.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingsScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    const Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ), 
            label: 'Meet & Chat'
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ), 
            label: 'Meetings'
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ), 
            label: 'Contacts'
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ), 
            label: 'Settings'
          ),
        ]
      ),
    );
  }
}