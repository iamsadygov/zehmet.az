// sp_search_screen.dart
import 'package:flutter/material.dart';
import 'sp_results_screen.dart';

class SPSearchScreen extends StatefulWidget {
  const SPSearchScreen({super.key});

  @override
  State<SPSearchScreen> createState() => _SPSearchScreenState();
}

class _SPSearchScreenState extends State<SPSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Təklif Axtar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Təklif kateqoriyası daxil edin',
                hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onSubmitted: (_) => _goToResults(context),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _goToResults(context),
              child: const Text('Axtar'),
            ),
          ],
        ),
      ),
    );
  }

  void _goToResults(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SPResultsScreen(query: _searchController.text),
      ),
    );
  }
}