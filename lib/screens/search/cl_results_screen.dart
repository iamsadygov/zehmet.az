import 'package:flutter/material.dart';

class CLResultsScreen extends StatelessWidget {
  final String query;
  const CLResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final allServices = [
      'Fotoqrafiya Xidməti',
      'Video Çəkilişi',
      'Ev Təmiri',
      'Maşın Yuma',
      'Kuryer Xidməti',
      'Kompüter Təmiri'
    ];

    final filtered = allServices
        .where((s) => s.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Axtarış Nəticələri'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filtered.isEmpty
            ? const Center(
          child: Text('Nəticə tapılmadı.',
              style: TextStyle(color: Colors.white)),
        )
            : ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final service = filtered[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    service,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios,
                      color: Colors.white, size: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
