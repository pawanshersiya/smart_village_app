import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:smart_village_animated/widgets/village_header.dart';

class AnnouncementDetailPage extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final String intro;
  final String fullDetails;
  final String location;
  final String organizedBy;
  final String phone;
  final Color badgeColor;
  final String type;

  const AnnouncementDetailPage({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.intro,
    required this.fullDetails,
    required this.location,
    required this.organizedBy,
    required this.phone,
    required this.badgeColor,
    required this.type,
  });

  @override
  State<AnnouncementDetailPage> createState() =>
      _AnnouncementDetailPageState();
}

class _AnnouncementDetailPageState extends State<AnnouncementDetailPage> {
  int _currentIndex = 2; // News tab selected
  bool _isBackHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body:
      Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔷 TOP GRADIENT HEADER
              const VillageHeader(
                title: "Gram Setu",
                subtitle: "Green Valley",
              ),



              /// 🔹 HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(14), // square with soft corners
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔙 BACK
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => _isBackHovered = true),
                      onExit: (_) => setState(() => _isBackHovered = false),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        borderRadius: BorderRadius.circular(10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: _isBackHovered
                                ? Colors.white
                                : Colors.transparent, // 👈 container appears on hover
                            borderRadius: BorderRadius.circular(10),
                            border: _isBackHovered
                                ? Border.all(color: Colors.grey.shade300)
                                : null,
                            boxShadow: _isBackHovered
                                ? const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ]
                                : [],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.arrow_back, size: 18),
                              SizedBox(width: 6),
                              Text(
                                "Back",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// 🟣 TYPE BADGE
                    Row(
                      children: [
                        Icon(Icons.event, size: 14, color: widget.badgeColor),
                        const SizedBox(width: 6),
                        Text(
                          widget.type,
                          style: TextStyle(
                            color: widget.badgeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// 📰 TITLE
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// 📅 DATE & TIME
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "${widget.date}   ${widget.time}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 📝 INTRO CARD
                    _iconInfoCard(
                      icon: Icons.description,
                      iconColor: Colors.blue,
                      title: "Details",
                      child: Text(
                        widget.fullDetails,
                        style: const TextStyle(height: 1.5),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// 📍 LOCATION
                    _iconInfoCard(
                      icon: Icons.location_on,
                      iconColor: Colors.purple,
                      title: "Location",
                      child: Text(widget.location),
                    ),

                    const SizedBox(height: 10),

                    /// 🏛 ORGANIZED BY
                    _iconInfoCard(
                      icon: Icons.groups,
                      iconColor: Colors.purple,
                      title: "Organized By",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.organizedBy,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.phone,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// 💾 ACTION BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16, // 👈 space from left & right page edge
                              vertical: 5, // 👈 space from top & bottom
                            ),
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 48),
                                // 👈 fixed height
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // 👈 squarish corners
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border),
                              label: const Text("Save"),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16, // 👈 space from left & right page edge
                              vertical: 5, // 👈 space from top & bottom
                            ),
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 48),
                                // 👈 fixed height
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // 👈 squarish corners
                                ),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                              label: const Text("Share"),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    /// ℹ FOOT NOTE
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFFE6EBF5), // light bluish background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.info_outline,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child:
                              Text(
                                "For more updates, check the announcements section regularly.",
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),

                  ],
                 // ),
                ),
                bottomNavigationBar: const AppBottomNav(currentIndex: 2)
              );
              }



  Widget _iconInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Widget child,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16, // 👈 space from left & right page edge
          vertical: 5,   // 👈 space from top & bottom
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: iconColor.withOpacity(0.15),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    child,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}