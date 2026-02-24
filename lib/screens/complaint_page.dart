import 'package:flutter/material.dart';
import 'package:smart_village_animated/screens/complain_detail_page.dart';
import 'package:smart_village_animated/screens/register_complaint_page.dart';
import '../widgets/bottom_nav_bar.dart';
import '../data/complaint_list.dart';
import "package:smart_village_animated/widgets/village_header.dart";

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),

      /// 🔹 FIXED HEADER
      body: Column(
        children: [
          const VillageHeader(
            title: "Gram Setu",
            subtitle: "Green Valley",
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Complaints",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Track your complaints and grievances",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 18),

                /// REGISTER BUTTON
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterComplaintPage(),
                        ),
                      );
                    },
                    child: Ink(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xFF2F6BFF),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Register New Complaint",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 SCROLLABLE CONTENT
          Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 16),
                shrinkWrap: true,
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  return _ComplaintCard(
                    complaint: complaints[index],
                  );
                },
              ),
          ),
        ],
       ),
      /// 🔹 BOTTOM NAV
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }
}

class _ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const _ComplaintCard({required this.complaint});

  @override
  Widget build(BuildContext context) {
    final  statusColor = complaint.statusColor;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          Row(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  complaint.status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              Text(
                "ID: ${complaint.id}",
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(width: 4),

              Text(complaint.date,
                  style:
                  const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(complaint.title,
              style:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 6),

          Text(complaint.description,
              style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 12),

          Text("${complaint.category}  •  ${complaint.location}",
              style: const TextStyle(fontSize: 12, color: Colors.grey)),

          const SizedBox(height: 12),

          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ComplaintDetailPage(complaint: complaint),
                ),
              );
            },
            icon: const Icon(Icons.track_changes, size: 16),
            label: const Text("Track Status"),
          ),
        ],
      ),
    );
  }
}

