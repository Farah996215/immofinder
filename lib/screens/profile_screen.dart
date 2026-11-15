import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryPurple = const Color(0xFF4B2A8B);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Mon Profil', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFE8E2FF),
                    child: Icon(Icons.person, size: 50, color: Color(0xFF4B2A8B)),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Ahmed Ben Ali', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('ahmed.benali@email.com', style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: primaryPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('Membre depuis 2024', style: TextStyle(color: primaryPurple, fontSize: 12, fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('Annonces', '12', primaryPurple),
                  _buildStatCard('Favoris', '45', primaryPurple),
                  _buildStatCard('Messages', '3', primaryPurple),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, spreadRadius: 1)],
              ),
              child: Column(
                children: [
                  _buildMenuItem(Icons.home_outlined, 'Mes Annonces', primaryPurple),
                  const Divider(height: 1, indent: 60),
                  _buildMenuItem(Icons.favorite_border, 'Mes Favoris', primaryPurple),
                  const Divider(height: 1, indent: 60),
                  _buildMenuItem(Icons.chat_bubble_outline, 'Mes Messages', primaryPurple),
                  const Divider(height: 1, indent: 60),
                  _buildMenuItem(Icons.payment, 'Méthodes de paiement', primaryPurple),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, spreadRadius: 1)],
              ),
              child: Column(
                children: [
                  _buildMenuItem(Icons.help_outline, 'Centre d\'aide', primaryPurple),
                  const Divider(height: 1, indent: 60),
                  _buildMenuItem(Icons.privacy_tip_outlined, 'Confidentialité', primaryPurple),
                  const Divider(height: 1, indent: 60),
                  _buildMenuItem(Icons.logout, 'Déconnexion', Colors.red, textColor: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, spreadRadius: 1)],
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 5),
            Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color iconColor, {Color textColor = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, color: textColor)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}