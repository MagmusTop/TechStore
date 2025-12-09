import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccueilController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  // Liste des meilleures ventes
  final List<Map<String, dynamic>> bestSellers = [
    {
      'title': 'iPhone 14 Pro Max',
      'subtitle': '1To • 16Go RAM',
      'price': '702.500',
      'rating': 4.6,
      'reviews': '(128)',
      'icon': Icons.phone_iphone,
      'iconColor': Color(0xFF2196F3),
    },
    {
      'title': 'JBL Charge 6',
      'subtitle': 'Portable Waterproof',
      'price': '52.500',
      'rating': 2.7,
      'reviews': '(45)',
      'icon': Icons.speaker,
      'iconColor': Color(0xFFFF9800),
    },
    {
      'title': 'AirPods Pro',
      'subtitle': 'ANC • 24h battery',
      'price': '250.000',
      'rating': 4.5,
      'reviews': '(89)',
      'icon': Icons.headphones,
      'iconColor': Color(0xFF4CAF50),
    },
  ];

  // Liste des catégories - CORRIGÉ: Icônes comme IconData, pas String
  final List<Map<String, dynamic>> categories = [
    {'title': 'Casques', 'icon': Icons.headphones, 'color': 0xFF4FC3F7},
    {'title': 'Laptop', 'icon': Icons.laptop, 'color': 0xFF9575CD},
    {'title': 'Téléphones', 'icon': Icons.phone_iphone, 'color': 0xFF81C784},
    {'title': 'Consoles de Jeux', 'icon': Icons.sports_esports, 'color': 0xFFFFB74D},
    {'title': 'Casques XR', 'icon': Icons.view_in_ar, 'color': 0xFFF06292}, // Changé vr_off_outlined par view_in_ar
    {'title': 'Montres', 'icon': Icons.watch, 'color': 0xFF64B5F6},
  ];
}
class AccueilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccueilController());
  }
}