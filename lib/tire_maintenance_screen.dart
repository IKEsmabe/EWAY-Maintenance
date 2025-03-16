import 'package:flutter/material.dart';

class TireMaintenanceScreen extends StatelessWidget {
  const TireMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
        title: const Text(
          'Tire Maintenance Guide',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Maintaining your tires is essential for safety and performance. Here’s how to keep them in good condition:",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/tire.png', // Add tire image in assets
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildSectionTitle("Tire Pressure:"),
                  buildBulletPoint("Check regularly: Use a tire gauge to check the pressure before each ride."),
                  buildBulletPoint("Recommended PSI: Inflate the tires to the PSI recommended on the tire sidewall (usually between 30-60 PSI depending on the tire type)."),
                  buildBulletPoint("Avoid under/over-inflation: Low pressure can cause flats, and high pressure can lead to poor grip and an uncomfortable ride."),
                  
                  const SizedBox(height: 12),
                  buildSectionTitle("Tire Inspection:"),
                  buildBulletPoint("Check for wear and tear: Inspect for cuts, punctures, or excessive wear on the tread. Replace tires when the tread is low (usually below 1.5 mm)."),
                  buildBulletPoint("Inspect sidewalls: Look for cracks or bulges, as they indicate potential safety issues."),

                  const SizedBox(height: 12),
                  buildSectionTitle("Cleaning and Protection:"),
                  buildBulletPoint("Clean tires: Wash off dirt and debris with mild soap and a soft brush."),
                  buildBulletPoint("Consider puncture protection: Use puncture-resistant tires or tire liners to prevent flats, and apply sealant for added protection."),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
