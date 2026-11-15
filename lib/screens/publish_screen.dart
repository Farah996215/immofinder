import 'package:flutter/material.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  final Color primaryPurple = const Color(0xFF4B2A8B);
  final Color lightPurple = const Color(0xFFF4F0FF); // For the photo upload background

  // Controller for the dropdown
  String? selectedPropertyType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Publier une annonce',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Photo Upload Area
            GestureDetector(
              onTap: () {
                // TODO: Handle image picker logic here later
              },
              child: CustomPaint(
                painter: DashedRectPainter(color: primaryPurple.withOpacity(0.5)),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: lightPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: primaryPurple, size: 36),
                      const SizedBox(height: 10),
                      Text(
                        'Ajouter des photos',
                        style: TextStyle(
                          color: primaryPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '(Appuyez pour choisir)',
                        style: TextStyle(
                          color: primaryPurple.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 2. Title Field
            _buildTextField('Titre de l\'annonce *'),
            const SizedBox(height: 20),

            // 3. Description Field
            _buildTextField('Description *', maxLines: 4),
            const SizedBox(height: 20),

            // 4. Property Type Dropdown
            const Text(
              'Type de bien',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Sélectionner...', style: TextStyle(color: Colors.grey[600])),
                  value: selectedPropertyType,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  items: <String>['Maison', 'Appartement', 'Villa', 'Terrain'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedPropertyType = newValue;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 5. Price Field
            _buildTextField('Prix (DT)'),
            
            // Add extra space at the bottom so the button doesn't hide fields
            const SizedBox(height: 40),
          ],
        ),
      ),
      
      // 6. Bottom "Publish" Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Handle publish logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Annonce publiée avec succès !')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Publier l\'annonce',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for text fields
  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
}

// Custom Painter to draw the dashed border around the upload area
class DashedRectPainter extends CustomPainter {
  final Color color;
  DashedRectPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;
    final double endX = size.width;
    double startY = 0;
    final double endY = size.height;

    // Draw top border
    while (startX < endX) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
    // Draw bottom border
    startX = 0;
    while (startX < endX) {
      canvas.drawLine(Offset(startX, endY), Offset(startX + dashWidth, endY), paint);
      startX += dashWidth + dashSpace;
    }
    // Draw left border
    while (startY < endY) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
    // Draw right border
    startY = 0;
    while (startY < endY) {
      canvas.drawLine(Offset(endX, startY), Offset(endX, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}