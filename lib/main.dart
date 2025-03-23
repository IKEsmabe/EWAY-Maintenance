import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(), // Set MainScreen as home
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                fontSize: 40, // Enlarged font size
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
                  'assets/battery.png',
                  'Battery',
                  const BatteryMaintenanceScreen(),
                ),
                const SizedBox(width: 20),
                _maintenanceButton(
                  context,
                  'assets/tire.png',
                  'Tire',
                  const TireMaintenanceScreen(),
                ),
                const SizedBox(width: 20),
                _maintenanceButton(
                  context,
                  'assets/services.png',
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
              Image.asset(imagePath, width: 120, height: 120), // Enlarged image size
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 24, // Enlarged font size
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
  const CustomTopBar({Key? key}) : super(key: key);

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

  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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

class TireMaintenanceScreen extends StatelessWidget {
  const TireMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text(
          'Tire Maintenance Guide',
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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Proper tire care is essential for ensuring your e-bike operates safely and efficiently.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Tire image
                  ClipOval(
                    child: Image.asset(
                      'assets/tire.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Tire Maintenance Tips
              const Text(
                'Tire Maintenance Tips:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Check tire pressure regularly: Ensure your tires are properly inflated to the recommended pressure.'),
              const BulletPoint(text: 'Inspect for wear and tear: Regularly check your tires for any signs of damage or excessive wear.'),
              const BulletPoint(text: 'Rotate tires: Rotate your tires periodically to ensure even wear.'),
              const BulletPoint(text: 'Keep tires clean: Clean your tires regularly to remove any debris or dirt.'),

              const SizedBox(height: 16),
              // Storage Tips
              const Text(
                'Storage Tips:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Store in a cool, dry place: Avoid storing your e-bike in extreme temperatures or humid conditions.'),
              const BulletPoint(text: 'Elevate the bike: If possible, elevate your bike to prevent flat spots on the tires.'),

              const SizedBox(height: 16),
              // Tire Health
              const Text(
                'Tire Health:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Replace worn tires: If your tires are excessively worn or damaged, replace them promptly.'),
              const BulletPoint(text: 'Monitor performance: If you notice any changes in handling or performance, inspect your tires for issues.'),
            ],
          ),
        ),
      ),
    );
  }
}
class ServicesMaintenanceScreen extends StatelessWidget {
  const ServicesMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text(
          'Services Maintenance Guide',
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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Regular maintenance services are crucial for ensuring your e-bike operates efficiently and safely.',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Services image
                  ClipOval(
                    child: Image.asset(
                      'assets/services.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Maintenance Tips
              const Text(
                'Maintenance Tips:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Regularly check and lubricate the chain: Keep the chain clean and lubricated to ensure smooth operation.'),
              const BulletPoint(text: 'Inspect brakes: Regularly check your brakes for wear and ensure they are functioning properly.'),
              const BulletPoint(text: 'Check and tighten bolts: Periodically check all bolts and fasteners to ensure they are secure.'),
              const BulletPoint(text: 'Inspect the frame: Regularly inspect the frame for any signs of damage or wear.'),

              const SizedBox(height: 16),
              // Storage Tips
              const Text(
                'Storage Tips:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Store in a cool, dry place: Avoid storing your e-bike in extreme temperatures or humid conditions.'),
              const BulletPoint(text: 'Cover the bike: Use a cover to protect your e-bike from dust and debris.'),

              const SizedBox(height: 16),
              // General Health
              const Text(
                'General Health:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const BulletPoint(text: 'Regularly service your e-bike: Schedule regular maintenance services to keep your e-bike in top condition.'),
              const BulletPoint(text: 'Monitor performance: If you notice any changes in performance, inspect your e-bike for issues.'),
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
