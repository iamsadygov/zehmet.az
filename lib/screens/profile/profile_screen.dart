import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isViewingAsClient = false;

  final List<Map<String, String>> servicesProvided = [
    {
      'title': 'Fotoqrafiya Xidməti',
      'price': '100 AZN',
      'location': 'Baki',
      'rating': '4.9'
    },
    {
      'title': 'Video Çəkilişi',
      'price': '150 AZN',
      'location': 'Sumqayit',
      'rating': '4.8'
    },
  ];

  final Map<String, String>? shopDetails = {
    'name': 'Zehmet Studio',
    'location': 'Nizami, Baku',
    'contact': '+994 50 123 45 67',
    'imageUrl': 'https://via.placeholder.com/400x200'
  };

  @override
  void initState() {
    super.initState();
    _loadRole();
  }

  Future<void> _loadRole() async {
    final prefs = await SharedPreferences.getInstance();
    final isServiceProvider = prefs.getBool('isServiceProvider') ?? true;
    setState(() {
      isViewingAsClient = !isServiceProvider; // reverse logic
    });
  }

  Future<void> _updateRole(bool isClient) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isServiceProvider', !isClient); // reverse logic
    setState(() {
      isViewingAsClient = isClient;
    });

    // Optional: go back to home and refresh UI
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Profil', style: TextStyle(color: Colors.white)),
        actions: [
          Switch(
            value: isViewingAsClient,
            onChanged: _updateRole,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: Text(
                isViewingAsClient ? 'Müştəri kimi' : 'Usta kimi',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Personal Information
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Süleyman Sadıqov', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Fotoqraf', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              child: const Text('Profilə düzəliş et'),
            ),

            // Services Provided
            const Text('Xidmətlər', style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 12),
            ...servicesProvided.map((service) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service['title']!,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text('${service['price']} - ${service['location']}',
                      style: const TextStyle(color: Colors.grey)),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(service['rating']!, style: const TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
            )),

            const SizedBox(height: 24),

            // Shop Details
            if (shopDetails != null) ...[
              const Text('Mağaza Məlumatları', style: TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (shopDetails!['imageUrl'] != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(shopDetails!['imageUrl']!),
                      ),
                    const SizedBox(height: 8),
                    Text('Ad: ${shopDetails!['name']}', style: const TextStyle(color: Colors.white)),
                    Text('Ünvan: ${shopDetails!['location']}', style: const TextStyle(color: Colors.white)),
                    Text('Əlaqə: ${shopDetails!['contact']}', style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}