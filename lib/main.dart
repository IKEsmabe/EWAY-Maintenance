import 'package:flutter/material.dart';
import 'tire_maintenance_screen.dart'; // Import the Tire Maintenance Screen
import 'battery_maintenance_screen.dart'; // Import the Battery Maintenance Screen
import 'services_maintenance_screen.dart'; // Import the Services Maintenance Screen
import 'maintenance_guide_screen.dart'; // Import the Maintenance Guide Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MaintenanceGuideScreen(), // Set MaintenanceGuideScreen as the home screen
    );
  }
}

class MaintenanceGuideScreen extends StatelessWidget {
  const MaintenanceGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text(
          'Maintenance Guide',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Maintenance Guide',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Row for 3 options
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  // Battery Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BatteryMaintenanceScreen()),
                      );
                    },
                    child: buildMaintenanceCard('assets/battery.png', 'Battery'),
                  ),
                  // Tire Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TireMaintenanceScreen()),
                      );
                    },
                    child: buildMaintenanceCard('assets/tire.png', 'Tire'),
                  ),
                  // Services Card
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ServicesMaintenanceScreen()),
                      );
                    },
                    child: buildMaintenanceCard('assets/services.png', 'Services'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card Builder Function
  Widget buildMaintenanceCard(String imagePath, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 80, width: 80, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
