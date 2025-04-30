//   ███████╗ █████╗ ██████╗ ██╗   ██╗ ██████╗  ██████╗ ██╗   ██╗
//   ██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝ ██╔═══██╗██║   ██║
//   ███████╗███████║██║  ██║ ╚████╔╝ ██║  ███╗██║   ██║██║   ██║
//   ╚════██║██╔══██║██║  ██║  ╚██╔╝  ██║   ██║██║   ██║╚██╗ ██╔╝
//   ███████║██║  ██║██████╔╝   ██║   ╚██████╔╝╚██████╔╝ ╚████╔╝
//   ╚══════╝╚═╝  ╚═╝╚═════╝    ╚═╝    ╚═════╝  ╚═════╝   ╚═══╝

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home/cl_home_screen.dart';
import '../screens/home/sp_home_screen.dart';
import '../screens/search/cl_results_screen.dart';
import '../screens/search/cl_search_screen.dart';
import '../screens/search/sp_results_screen.dart';
import '../screens/search/sp_search_screen.dart';
import '../screens/post_job/post_job_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/messages/messages_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  bool _isServiceProvider = true;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    final isUsta = prefs.getBool('isServiceProvider') ?? true;
    setState(() {
      _isServiceProvider = isUsta;
    });
  }

  Future<void> setUserRole(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isServiceProvider', value);
    setState(() {
      _isServiceProvider = value;
      _selectedIndex = 0; // reset to home
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = _isServiceProvider
        ? [
      const SPHomeScreen(),
      const SPSearchScreen(),
      const MessagesScreen(),
      const ProfileScreen(),
      const SettingsScreen(),
    ]
        : [
      const HomePage(),
      const CLSearchScreen(),
      const MessagesScreen(),
      const ProfileScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFF4A80F0),
        unselectedItemColor: const Color(0xFFB0B0B0),
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Əsas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Axtarış',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mesajlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}