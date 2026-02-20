import 'package:flutter/material.dart';
import '../screens/complaint_page.dart';
import '../screens/dashboard_page.dart';
import '../screens/news_page.dart';


class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      onTap: (i) {

        // Prevent reload if same tab pressed
        if (i == currentIndex) return;

        if (i == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
          );
        }

        if (i == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const NewsPage()),
          );
        }

        if (i == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ComplaintsPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Services"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "News"),
        BottomNavigationBarItem(icon: Icon(Icons.report), label: "Complaints"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
      ],
    );
  }
}