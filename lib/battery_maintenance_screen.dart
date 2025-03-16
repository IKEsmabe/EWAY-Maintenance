import 'package:flutter/material.dart';

class BatteryMaintenanceScreen extends StatelessWidget {
  const BatteryMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text(
          'Battery Maintenance Guide',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Proper battery care is crucial for ensuring your e-bike operates efficiently and for prolonging its lifespan.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Battery image
                  ClipOval(
                    child: Image.asset(
                      'assets/battery.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Charging Tips
              const Text(
                'Charging Tips:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Charge after each ride: Always recharge your battery after a ride, even if you haven\'t used all the battery power.'),
              const BulletPoint(text: 'Avoid overcharging: Don\'t leave your battery plugged in for extended periods once it\'s fully charged.'),
              const BulletPoint(text: 'Charge in a cool, dry place: Avoid extreme temperatures while charging (either too hot or too cold).'),

              const SizedBox(height: 16),
              // Storage Tips
              const Text(
                'Storage Tips:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Store partially charged: If you’re not using your bike for a while, store the battery at 50-70% charge.'),
              const BulletPoint(text: 'Cool, dry storage: Store the battery in a cool, dry location to prevent damage.'),

              const SizedBox(height: 16),
              // Battery Health
              const Text(
                'Battery Health:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Regularly check the battery: Ensure the battery is securely mounted, clean, and shows no signs of wear or corrosion.'),
              const BulletPoint(text: 'Monitor performance: If the battery life is significantly reduced, it may need to be replaced.'),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget for bullet points
class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
