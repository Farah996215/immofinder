import 'package:flutter/material.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = const Color(0xFF4B2A8B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '1 / 6',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '320 000 DT',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryPurple),
                      ),
                      const SizedBox(height: 5),
                      const Text('Villa moderne à Hammamet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 4),
                          Text('(120 avis)', style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSpecItem(Icons.bed_outlined, '4 Chambres'),
                          _buildSpecItem(Icons.bathtub_outlined, '2 Salles de bain'),
                          _buildSpecItem(Icons.crop_square, '200 m²'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 15),
                      const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(
                        'Magnifique villa située dans un quartier calme à Hammamet, avec piscine et jardin privé. Parfait pour une famille ou comme investissement locatif.',
                        style: TextStyle(color: Colors.grey[700], height: 1.5, fontSize: 14),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.ios_share, color: Colors.black, size: 20),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.black, size: 20),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                  label: const Text('Contacter le vendeur', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF4B2A8B), size: 20),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}