import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre de navigation inférieure
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF4B2A8B),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoris'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40, color: Color(0xFF4B2A8B)), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête (Localisation et Notifications)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF4B2A8B), size: 20),
                      SizedBox(width: 5),
                      Text('Tunis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none, color: Color(0xFF4B2A8B)),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Barre de recherche
              TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un bien...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Catégories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(Icons.home, 'Vente', const Color(0xFFE8E2FF), const Color(0xFF4B2A8B)),
                  _buildCategory(Icons.key, 'Location', const Color(0xFFFFF3E0), Colors.orange),
                  _buildCategory(Icons.apartment, 'Neuf', const Color(0xFFE3F2FD), Colors.blue),
                  _buildCategory(Icons.park, 'Terrain', const Color(0xFFE8F5E9), Colors.green),
                ],
              ),
              const SizedBox(height: 24),

              // Bannière Promotionnelle (Remplacer par Image.asset)
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4B2A8B), Color(0xFF7B52C9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Trouvez la maison\nde vos rêves',
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF4B2A8B),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Découvrir →'),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Titre Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Annonces populaires', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Voir tout >', style: TextStyle(color: Color(0xFF4B2A8B))),
                  )
                ],
              ),

              // Carte d'annonce (Remplacer par vos données dynamiques)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 10, spreadRadius: 2),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Image de la maison (placeholder gris)
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: const Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                        // Bouton Favori
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('250 000 DT', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4B2A8B))),
                          const SizedBox(height: 5),
                          const Text('Appartement S+2', style: TextStyle(fontWeight: FontWeight.w600)),
                          const Text('À La Marsa', style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              Text('(120 avis)', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour les catégories (Vente, Location, etc.)
  Widget _buildCategory(IconData icon, String title, Color bgColor, Color iconColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}