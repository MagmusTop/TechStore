import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccueilController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxBool isDarkMode = false.obs;
  final RxInt currentPromoIndex = 0.obs;
  final PageController pageController = PageController();

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void setTheme(bool darkMode) {
    isDarkMode.value = darkMode;
  }

  // Liste des meilleures ventes - TOUTES LES VALEURS DÉFINIES
  final List<Map<String, dynamic>> bestSellers = [
    {
      'title': 'iPhone 14 Pro Max | 1To |16GB RAM',
      'price': '702.500',
      'rating': 4.6,
      'reviews': '(4.6)',
      'deliveryInfo': 'Livraison gratuite',
    },
    {
      'title': 'JBL Charge 6 | Portable Waterproof',
      'price': '52.500',
      'rating': 3.7,
      'reviews': '(3.7)',
      'deliveryInfo': 'Livraison à partir de 1.500 XOF/km',
    },
  ];

  // Liste des catégories
  final List<Map<String, dynamic>> categories = [
    {'title': 'Casques'},
    {'title': 'Laptop'},
    {'title': 'Téléphones'},
    {'title': 'Consoles de Jeux'},
    {'title': 'Casques XR'},
    {'title': 'Montres'},
  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class AccueilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccueilController());
  }
}