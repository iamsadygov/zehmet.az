//cl_home_screen.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isClient = true; // TEMP LOGIC: Replace with actual user role

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(isClient),
              const SizedBox(height: 24),
              isClient ? _buildClientView() : _buildWorkerView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isClient) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFCCCCCC),
              ),
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

  Widget _buildClientView() {
    return Expanded(
      child: ListView(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A80F0),
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.add_task, color: Colors.black),
            label: const Text(
              'Post a Task',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Your Recent Tasks',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          const SizedBox(height: 16),
          _taskCard('Website Redesign', '\$250', 'Remote', 'Active', 'Posted 2 days ago', Colors.green),
          _taskCard('Logo Design', '\$120', 'Remote', 'Completed', 'Posted 1 week ago', const Color(0xFF757575)),
          _taskCard('Content Writing', '\$180', 'Remote', 'In Progress', 'Posted 3 days ago', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildWorkerView() {
    return Expanded(
      child: ListView(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.search, color: Colors.black),
            label: const Text(
              'Browse Tasks',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Available Tasks',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          const SizedBox(height: 16),
          _taskCard('Mobile App Development', '\$500', 'New York, NY', '', 'Posted 1 day ago', Colors.blue),
          _taskCard('Social Media Management', '\$350', 'Remote', '', 'Posted 3 days ago', Colors.blue),
          _taskCard('Video Editing', '\$200', 'Los Angeles, CA', '', 'Posted 5 days ago', Colors.blue),
        ],
      ),
    );
  }

  Widget _taskCard(String title, String price, String location, String status, String posted, Color tagColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
              Text(price,
                  style: TextStyle(
                      color: tagColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14))
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  color: Color(0xFFCCCCCC), size: 16),
              const SizedBox(width: 4),
              Text(location,
                  style: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 13))
            ],
          ),
          if (status.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              posted,
              style:
              const TextStyle(color: Color(0xFFCCCCCC), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}