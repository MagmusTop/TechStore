import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/Auth/CONNEXION/page_CONNEXION.dart';

class PageOnboarding extends StatefulWidget {
  const PageOnboarding({super.key});

  @override
  State<PageOnboarding> createState() => _PageOnboardingState();
}

class _PageOnboardingState extends State<PageOnboarding> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.off(() => const PageConnexion());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: const [
                OnboardingItem(
                  title: "Bienvenue sur TechStore",
                  description:
                  "Votre boutique en ligne pour tous les accessoires technologiques.",
                  icon: Icons.devices,
                ),
                OnboardingItem(
                  title: "Simple et rapide",
                  description:
                  "Achetez facilement vos accessoires technologiques en quelques clics.",
                  icon: Icons.flash_on,
                ),
                OnboardingItem(
                  title: "Commencez maintenant",
                  description:
                  "Connectez-vous et profitez de la meilleure expérience TechStore.",
                  icon: Icons.lock,
                ),
              ],
            ),
          ),

          // Indicateurs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
                  (index) => Container(
                margin: const EdgeInsets.all(4),
                width: currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 37, 28, 217),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Bouton Suivant / Commencer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 37, 28, 217),
                  foregroundColor: Colors.white, // texte en blanc
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentPage == 2 ? "Commencer" : "Suivant",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const OnboardingItem({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 120,
            color: const Color.fromARGB(255, 37, 28, 217),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey, // Description visible sur fond blanc
            ),
          ),
        ],
      ),
    );
  }
}

