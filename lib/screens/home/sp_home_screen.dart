//sp_home_screen.dart

import 'package:flutter/material.dart';

class SPHomeScreen extends StatelessWidget {
  const SPHomeScreen({super.key});

  final String userProfession = 'Photographer'; // replace with actual logic later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.notifications_none, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              const Text(
                'Offers Made To You',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              _offerCard('Wedding Photography', '\$700', 'Baku', 'Pending', '2 days ago'),
              const SizedBox(height: 24),
              Text(
                'Offers Related to "$userProfession"',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              _offerCard('Event Photography', '\$400', 'Sumqayit', 'New', '1 day ago'),
              _offerCard('Product Photoshoot', '\$250', 'Online', 'New', 'Today'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 16, color: Color(0xFFCCCCCC)),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFF2E2E2E),
          backgroundImage: NetworkImage('https://placehold.co/500x500'),
        ),
      ],
    );
  }

  Widget _offerCard(String title, String price, String location, String status, String postedTime) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
              Text(price,
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14))
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Color(0xFFCCCCCC), size: 16),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 13))
            ],
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              status,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              postedTime,
              style: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}