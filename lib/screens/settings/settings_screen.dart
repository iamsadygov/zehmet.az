// settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        title: const Text(
          'Ayarlar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Dil', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.language, color: Colors.white70),
          ),
          ListTile(
            title: Text('Bildirişlər', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.notifications, color: Colors.white70),
          ),
          ListTile(
            title: Text('Təhlukəsizlik', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.lock, color: Colors.white70),
          ),
          ListTile(
            title: Text('Çıxış', style: TextStyle(color: Colors.redAccent)),
            trailing: Icon(Icons.exit_to_app, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}