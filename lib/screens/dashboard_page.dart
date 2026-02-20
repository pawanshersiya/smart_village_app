import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:smart_village_animated/widgets/village_header.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔷 TOP GRADIENT HEADER
              const VillageHeader(
                title: "Gram Setu",
                subtitle: "Green Valley",
              ),

    Expanded(
    child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// WELCOME
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Green Valley Village Dashboard",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 16),

              /// ANNOUNCEMENT
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16 ),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "New Announcement",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Village council meeting scheduled for Jan 25, 2026",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// STATS GRID

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  StatCard("Population", "2,847", "+2.3% this year",
                      Icons.groups_rounded, Colors.green),
                  StatCard("Water Supply", "Good", "98% coverage",
                      Icons.water_drop_rounded, Colors.blue),
                  StatCard("Power Status", "Stable", "99.2% uptime",
                      Icons.bolt_rounded, Colors.orange),
                  StatCard("Waste Mgmt", "On Track", "Next: Tomorrow",
                      Icons.delete_outline_rounded, Colors.green),
                ],
              ),

              const SizedBox(height: 20),

              /// THIS MONTH
              _sectionCard(
                title: "This Month",
                children: const [
                  InfoRow("Active Complaints", "12", Colors.blue),
                  InfoRow("Resolved Issues", "38", Colors.green),
                  InfoRow("Upcoming Events", "5", Colors.purple),
                  InfoRow("New Announcements", "3", Colors.orange),
                ],
              ),

              const SizedBox(height: 20),

              /// RECENT ACTIVITY
              const Text(
                "Recent Activity",
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              _activityTile(
                "Street Light Repair Completed",
                "Main Road, Ward 3 • 2 hours ago",
                Colors.green,
              ),
              _activityTile(
                "Water Supply Schedule Updated",
                "All Wards • 5 hours ago",
                Colors.blue,
              ),
              _activityTile(
                "Road Maintenance Started",
                "East Avenue • Yesterday",
                Colors.orange,
              ),
            ],
          ),
        ),
       ),
      ],
    ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }

  /// COMPONENTS 👇

  Widget _sectionCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _activityTile(
      String title, String subtitle, Color dotColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.circle, size: 10, color: dotColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                    const TextStyle(fontWeight: FontWeight.w600)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// SMALL WIDGETS

class StatCard extends StatelessWidget {
  final String title, value, subtitle;
  final IconData icon;
  final Color color;

  const StatCard(
      this.title, this.value, this.subtitle, this.icon, this.color,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,

            height: 44,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(subtitle,
              style:
              const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label, value;
  final Color color;

  const InfoRow(this.label, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Text(
            value,
            style:
            TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
