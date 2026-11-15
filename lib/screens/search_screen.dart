import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'property_details_screen.dart';
import 'publish_screen.dart'; 

class SearchScreen extends StatefulWidget {
  final String? initialSearchText;

  const SearchScreen({super.key, this.initialSearchText});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedTransaction = 'Vente';
  RangeValues _currentPriceRange = const RangeValues(50000, 1000000);
  String selectedPropertyType = 'Maison';

  late TextEditingController _searchController;

  final Color primaryPurple = const Color(0xFF4B2A8B);
  final Color lightGrey = const Color(0xFFF3F3F5);

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialSearchText);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Recherche',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildTransactionToggle(),
            const SizedBox(height: 25),
            _buildPriceSection(),
            const SizedBox(height: 25),
            _buildPropertyTypeSection(),
            const SizedBox(height: 25),
            _buildApplyButton(),
            const SizedBox(height: 30),
            _buildResultsHeader(),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyDetailsScreen()),
                );
              },
              child: _buildPropertyCard(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Ville, quartier...',
        hintStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryPurple, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildTransactionToggle() {
    List<String> options = ['Vente', 'Location', 'Tous'];
    return Row(
      children: options.map((option) {
        bool isSelected = selectedTransaction == option;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => setState(() => selectedTransaction = option),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? primaryPurple : lightGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    option,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Prix (DT)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Text(
          '${_currentPriceRange.start.toInt()} - ${_currentPriceRange.end.toInt()}',
          style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: primaryPurple,
            inactiveTrackColor: primaryPurple.withOpacity(0.2),
            thumbColor: primaryPurple,
            overlayColor: primaryPurple.withOpacity(0.2),
            trackHeight: 4.0,
          ),
          child: RangeSlider(
            values: _currentPriceRange,
            min: 0,
            max: 2000000,
            onChanged: (RangeValues values) {
              setState(() => _currentPriceRange = values);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Type de bien', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTypeItem('Maison', Icons.home),
            _buildTypeItem('Appartement', Icons.apartment),
            _buildTypeItem('Villa', Icons.villa),
            _buildTypeItem('Terrain', Icons.landscape),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeItem(String label, IconData icon) {
    bool isSelected = selectedPropertyType == label;
    return GestureDetector(
      onTap: () => setState(() => selectedPropertyType = label),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: isSelected ? primaryPurple.withOpacity(0.1) : lightGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isSelected ? primaryPurple : Colors.grey[600], size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? primaryPurple : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text(
          'Appliquer les filtres',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildResultsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Résultats (24)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapScreen()),
            );
          },
          icon: Icon(Icons.location_on, color: primaryPurple, size: 18),
          label: Text('Voir sur la carte', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildPropertyCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.05), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('320 000 DT', style: TextStyle(color: primaryPurple, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  const Text('Villa à Hammamet', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text('4.9 (89)', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryPurple,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (index) {
        if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PublishScreen()));
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoris'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Color(0xFF4B2A8B),
            radius: 20,
            child: Icon(Icons.add, color: Colors.white),
          ),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}