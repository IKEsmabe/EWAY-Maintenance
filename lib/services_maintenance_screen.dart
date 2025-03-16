import 'package:flutter/material.dart';

class ServicesMaintenanceScreen extends StatelessWidget {
  const ServicesMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2F1), // Light green background
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Services Maintenance Guide',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black54),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Regular servicing is key to ensuring your e-bike performs at its best and lasts longer.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/service.png', // Make sure this asset exists
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'General E-Bike Care:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildBulletPoint('Chain and Drivetrain:'),
              _buildSubBullet('Clean the chain: Use a degreaser to clean off any dirt or grease.'),
              _buildSubBullet('Lubricate the chain: After cleaning, apply a bike-specific lubricant to prevent wear and rust.'),
              const SizedBox(height: 10),
              _buildBulletPoint('Brake Maintenance:'),
              _buildSubBullet('Inspect brake pads: Check for wear and replace when they get too thin.'),
              _buildSubBullet('Check brake function: Ensure both front and rear brakes are responsive. Adjust cables if necessary.'),
              const SizedBox(height: 10),
              _buildBulletPoint('Display and Controls:'),
              _buildSubBullet('Test your display: Make sure your display is functioning, showing battery level, speed, and other vital information.'),
              _buildSubBullet('Check controls: Ensure the throttle and pedal-assist functions are working properly.'),
              const SizedBox(height: 10),
              _buildBulletPoint('Full Annual Servicing:'),
              _buildSubBullet('Take it to a professional: Once a year, have a professional technician do a comprehensive inspection and tune-up, including checking the battery, motor, wheels, and overall performance.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSubBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
