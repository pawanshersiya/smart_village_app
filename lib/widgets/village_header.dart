import 'package:flutter/material.dart';
class VillageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isOnline;

  const VillageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.isOnline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E88E5), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// LEFT TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),

          const Spacer(),

          /// ONLINE STATUS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: isOnline ? Colors.green : Colors.red,
                  size: 10,
                ),
                const SizedBox(width: 6),
                Text(
                  isOnline ? "Online" : "Offline",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

