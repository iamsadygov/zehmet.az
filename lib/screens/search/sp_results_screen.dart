import 'package:flutter/material.dart';

class SPResultsScreen extends StatelessWidget {
  final String query;
  const SPResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final allTasks = [
      'Divar Rənglənməsi',
      'Plintus Montajı',
      'Kondisioner Təmiri',
      'Laptop Formatlama',
      'Çilçıraq Quraşdırılması',
      'Santexnik Xidməti'
    ];

    final filtered = allTasks
        .where((task) => task.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Təkliflər Axtarışı'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filtered.isEmpty
            ? const Center(
            child: Text('Heç bir uyğun təklif tapılmadı.',
                style: TextStyle(color: Colors.white)))
            : ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final task = filtered[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        task,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.attach_money,
                          color: Colors.greenAccent, size: 20),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Task haqqında qısa məlumat.',
                    style:
                    TextStyle(color: Color(0xFFCCCCCC), fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Təklif edildi: 2 gün əvvəl',
                    style:
                    TextStyle(color: Color(0xFF999999), fontSize: 12),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}