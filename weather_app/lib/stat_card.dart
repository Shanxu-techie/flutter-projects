import 'package:flutter/material.dart';

import 'frosted_glass_container.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FrostedGlassContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 16),
          child: Column(
            children: [
              Icon(icon),
              SizedBox(height: 8),
              FittedBox(child: Text(value, style: TextStyle(fontSize: 16)),),
              SizedBox(height: 6),
              Text(label, style: TextStyle(fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ),
    );
  }
}
