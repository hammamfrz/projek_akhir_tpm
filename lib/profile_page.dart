import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
      ],
        title: const Text('Profile Menu'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hammam Fariz Raharjo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'NIM : 123200062',
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 40,
            ),
          ]
        ),
      ),
    );
  }
}