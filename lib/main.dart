import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(), // Set MainScreen as home
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(), // Add the custom top bar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Maintenance Guide',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _maintenanceButton(
                  context,
                  'lib/assets/battery.png',
                  'Battery',
                  const BatteryMaintenanceScreen(),
                ),
                const SizedBox(width: 20),
                _maintenanceButton(
                  context,
                  'lib/assets/tire.png',
                  'Tire',
                  const TireMaintenanceScreen(),
                ),
                const SizedBox(width: 20),
                _maintenanceButton(
                  context,
                  'lib/assets/services.png',
                  'Services',
                  const ServicesMaintenanceScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _maintenanceButton(BuildContext context, String imagePath, String label, Widget destination) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Column(
            children: [
              Image.asset(imagePath, width: 100, height: 100),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ✅ Custom Top Bar widget (Nav bar)
class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFAED9B6), // Light green background color
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left-side navigation links
          Row(
            children: [
              _navItem(context, 'Home', const MainScreen()),
              const SizedBox(width: 16),
              _navItem(context, 'Showcase', const PlaceholderScreen(title: 'Showcase')),
              const SizedBox(width: 16),
              _navItem(context, 'Registration', const PlaceholderScreen(title: 'Registration')),
              const SizedBox(width: 16),
              _navItem(context, 'Regulations', const PlaceholderScreen(title: 'Regulations')),
              const SizedBox(width: 16),
              _navItem(context, 'Maintenance', const PlaceholderScreen(title: 'Maintenance')),
            ],
          ),
          // Right-side Sign In
          InkWell(
            onTap: () {
              // Handle Sign In tap
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign In tapped!')));
            },
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  // Helper method for navigation item
  Widget _navItem(BuildContext context, String title, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// ✅ Placeholder screen for demo purposes
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(),
      body: Center(
        child: Text(title, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}

class BatteryMaintenanceScreen extends StatelessWidget {
  const BatteryMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(),
      body: const Center(
        child: Text('Battery Maintenance Screen'),
      ),
    );
  }
}

class TireMaintenanceScreen extends StatelessWidget {
  const TireMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(),
      body: const Center(
        child: Text('Tire Maintenance Screen'),
      ),
    );
  }
}

class ServicesMaintenanceScreen extends StatelessWidget {
  const ServicesMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(),
      body: const Center(
        child: Text('Services Maintenance Screen'),
      ),
    );
  }
}
