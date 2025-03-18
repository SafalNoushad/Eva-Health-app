import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF7E57C2),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 24),
            Text('Jane Doe', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(children: [
                      const Icon(Icons.cake),
                      const SizedBox(width: 12),
                      Text('Birth Year: N/A',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ]),
                    const SizedBox(height: 12),
                    Row(children: [
                      const Icon(Icons.person_outline),
                      const SizedBox(width: 12),
                      Text('Nickname: Jane',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
