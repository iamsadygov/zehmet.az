// cl_search_screen.dart
import 'package:flutter/material.dart';
import 'cl_results_screen.dart';

class CLSearchScreen extends StatefulWidget {
  const CLSearchScreen({super.key});

  @override
  State<CLSearchScreen> createState() => _CLSearchScreenState();
}

class _CLSearchScreenState extends State<CLSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Xidmət Axtar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Xidmət növünü daxil edin',
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

  void _goToResults(BuildContext context) {Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => CLResultsScreen(query: _searchController.text),
    ),
  );
  }
}