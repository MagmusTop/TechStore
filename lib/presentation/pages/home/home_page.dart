import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        backgroundColor: const Color(0xFF5B4EFF),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100, color: Color(0xFF5B4EFF)),
            const SizedBox(height: 20),
            const Text(
              'Page Accueil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('🚧 En cours de développement...'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Get.toNamed('/catalogue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B4EFF),
              ),
              child: const Text('Aller au Catalogue'),
            ),
          ],
        ),
      ),
    );
  }
}
