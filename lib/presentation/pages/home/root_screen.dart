import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'accueil_controller.dart';
import 'accueil_page.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});

  final AccueilController controller = Get.find<AccueilController>();

  @override
  Widget build(BuildContext context) {
    final AccueilController controller = Get.find<AccueilController>();

    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return AccueilPage();
          case 1:
            return _buildPlaceholderPage("Catégorie", Icons.category, controller);
          case 2:
            return _buildPlaceholderPage("Mon Profil", Icons.person, controller);
          case 3:
            return _buildPlaceholderPage("Panier", Icons.shopping_cart, controller);
          case 4:
            return _buildPlaceholderPage("À Propos", Icons.info, controller);
          default:
            return AccueilPage();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'Accueil',
                isActive: controller.selectedIndex.value == 0,
                onTap: () => controller.changeTabIndex(0),
              ),
              _buildNavItem(
                icon: Icons.category_outlined,
                activeIcon: Icons.category,
                label: 'Catégorie',
                isActive: controller.selectedIndex.value == 1,
                onTap: () => controller.changeTabIndex(1),
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Mon profil',
                isActive: controller.selectedIndex.value == 2,
                onTap: () => controller.changeTabIndex(2),
              ),
              _buildNavItem(
                icon: Icons.shopping_cart_outlined,
                activeIcon: Icons.shopping_cart,
                label: 'Panier',
                isActive: controller.selectedIndex.value == 3,
                onTap: () => controller.changeTabIndex(3),
              ),
              _buildNavItem(
                icon: Icons.info_outline,
                activeIcon: Icons.info,
                label: 'À propos',
                isActive: controller.selectedIndex.value == 4,
                onTap: () => controller.changeTabIndex(4),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isActive ? activeIcon : icon,
            color: isActive ? const Color(0xFF7C4DFF) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: isActive ? const Color(0xFF7C4DFF) : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderPage(String title, IconData icon, AccueilController controller) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => controller.changeTabIndex(0),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: const Color(0xFF7C4DFF).withOpacity(0.5)),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Cette page est en cours de développement",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.changeTabIndex(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C4DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                "Retour à l'accueil",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}