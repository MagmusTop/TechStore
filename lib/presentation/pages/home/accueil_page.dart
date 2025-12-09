import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'accueil_controller.dart';

class AccueilPage extends GetView<AccueilController> {
@override
  final AccueilController controller =Get.put(AccueilController());
  AccueilPage({super.key});
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header avec titre et localisation
            _buildHeader(),
            const SizedBox(height: 20),

            // Barre de recherche
            _buildSearchBar(),
            const SizedBox(height: 25),

            // Produit en promotion 50%
            _buildPromoBanner(),
            const SizedBox(height: 30),

            // Section Meilleures Ventes
            _buildBestSellersSection(),
            const SizedBox(height: 30),

            // Section Catégories
            _buildCategoriesSection(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Accueil",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Découvrez nos produits tech",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.deepPurple[50],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.deepPurple,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                "Dakar, Sénégal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.deepPurple[400],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: const Row(
        children: [
          SizedBox(width: 15),
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ex : iPhone 15 pro max',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    ),
  );
}

Widget _buildPromoBanner() {
  return GestureDetector(
    onTap: () {
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF7C4DFF), Color(0xFFB388FF)],
        ),
        image: const DecorationImage(
          image: AssetImage('design/assets/Iphone14.png'),
          fit: BoxFit.cover,
          opacity: 0.3, // Transparence pour voir le gradient
        ),
      ),
      child: Stack(
        children: [
          // Badge de pourcentage en haut à droite
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                "50%",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C4DFF),
                ),
              ),
            ),
          ),

          // Bouton d'icône de panier en bas à gauche
          Positioned(
            left: 15,
            bottom: 15,
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF7C4DFF),
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildBestSellersSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "MEILLEURES VENTES",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 310, // Augmenté de 280 à 310
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 20, right: 10),
          itemCount: controller.bestSellers.length,
          itemBuilder: (context, index) {
            final product = controller.bestSellers[index];
            return _buildProductCard(
              title: product['title'] as String,
              subtitle: product['subtitle'] as String,
              price: product['price'] as String,
              rating: product['rating'] as double,
              reviews: product['reviews'] as String,
              icon: product['icon'] as IconData,
              iconColor: product['iconColor'] as Color,
              index: index,
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildProductCard({
  required String title,
  required String subtitle,
  required String price,
  required double rating,
  required String reviews,
  required IconData icon,
  required Color iconColor,
  required int index,
}) {
  return Container(
    width: 200,
    margin: const EdgeInsets.only(right: 15),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Changé de max à min
      children: [
        // Icône du produit
        Container(
          height: 130, // Augmenté de 120 à 130
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: iconColor.withOpacity(0.1),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 65, // Augmenté de 60 à 65
              color: iconColor,
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Titre et sous-titre
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Étoiles et avis
        Row(
          children: [
            _buildStarRating(rating),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                '$rating $reviews',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Prix et livraison
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '$price FCFA',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7C4DFF),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                index == 1 ? "À partir de\n1.500 FCFA" : "Livraison\ngratuite",
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildStarRating(double rating) {
  return Row(
    children: List.generate(5, (index) {
      if (index < rating.floor()) {
        return const Icon(
          Icons.star,
          size: 16,
          color: Colors.amber,
        );
      } else if (index < rating) {
        return const Icon(
          Icons.star_half,
          size: 16,
          color: Colors.amber,
        );
      } else {
        return const Icon(
          Icons.star_border,
          size: 16,
          color: Colors.grey,
        );
      }
    }),
  );
}

Widget _buildCategoriesSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "NOS CATEGORIES DE PRODUITS",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.95, // Augmenté de 0.9 à 0.95
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return _buildCategoryCard(
              title: category['title'] as String,
              icon: category['icon'] as IconData,
              color: Color(category['color'] as int),
            );
          },
        ),
      ],
    ),
  );
}

Widget _buildCategoryCard({
  required String title,
  required IconData icon,
  required Color color,
}) {
  return Container(
    padding: const EdgeInsets.all(10), // Ajouté du padding
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34, // Augmenté de 60 à 65
          height: 34, // Augmenté de 60 à 65
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.2),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 32, // Augmenté de 30 à 32
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
}