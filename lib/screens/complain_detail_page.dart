import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../data/complaint_list.dart';
import 'package:smart_village_animated/widgets/village_header.dart';

class ComplaintDetailPage extends StatefulWidget {
  final Complaint complaint;

  const ComplaintDetailPage({
    super.key,
    required this.complaint,
  });

  @override
  State<ComplaintDetailPage> createState() => _ComplaintDetailPageState();
}

class _ComplaintDetailPageState extends State<ComplaintDetailPage> {
  bool _isBackHovered = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: Column(
            children: [
              const VillageHeader(
                title: "Gram Setu",
                subtitle: "Green Valley",
              ),

              _header(),
                const SizedBox(height: 14),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child:  Column(
                    children: [
                    ComplaintDetailsCard(complaint: widget.complaint),
                    const SizedBox(height: 14),
                    StatusTimelineCard(complaint: widget.complaint),
                    const SizedBox(height: 14),
                    DepartmentCard(complaint: widget.complaint),
                    const SizedBox(height: 18),
                    BottomButtons(complaint: widget.complaint),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }

  Widget _header() {
    return Column(
      children: [
        /// ================= DETAILS SECTION =================
        Container(
          width: double.infinity,
          // color: const Color(0xFFDFF3FF),
          color: widget.complaint.statusColor2,
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Hover Back Button
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _isBackHovered = true),
                onExit: (_) => setState(() => _isBackHovered = false),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: AnimatedContainer(
                    duration:
                    const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: _isBackHovered
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: _isBackHovered
                          ? Border.all(
                          color: Colors.grey.shade300)
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
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back, size: 18),
                        SizedBox(width: 6),
                        Text(
                          "Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              /// Status + ID
              Row(
                children: [
                  Icon(Icons.info_outline, size: 16, color: widget.complaint.statusColor),
                  const SizedBox(width: 6),
                  Text(widget.complaint.status,
                      style: TextStyle(color: widget.complaint.statusColor)),
                  const Spacer(),
                  Text("ID: #${widget.complaint.id}",
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                widget.complaint.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263238),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 14, color: Colors.black54),
                  const SizedBox(width: 6),
                  Text(widget.complaint.date,
                      style: const TextStyle(color: Colors.black54)),
                  const SizedBox(width: 16),
                  const Icon(Icons.location_on, size: 14, color: Colors.black54),
                  const SizedBox(width: 4),
                  Text(widget.complaint.location,
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class ComplaintDetailsCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintDetailsCard({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.chat_bubble_outline, color: Colors.blue),
              SizedBox(width: 8),
              Text("Complaint Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          SizedBox(height: 12),
          Text(complaint.description,
              style: TextStyle(color: Colors.grey)
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.sell_outlined, size: 16),
              SizedBox(width: 6),
              Text("Category: ",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(complaint.category,
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusTimelineCard extends StatelessWidget {
  final Complaint complaint;

  const StatusTimelineCard({
    super.key,
    required this.complaint,
  });

  int getCurrentStep() {
    switch (complaint.status.toLowerCase()) {
      case "pending":
        return 0;
      case "in progress":
        return 1;
      case "resolved":
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = getCurrentStep();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.access_time, color: Colors.blue),
              SizedBox(width: 8),
              Text("Status Timeline",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),

          /// ---------------- PENDING ----------------
          if (step == 0) ...[
            _timelineItem(
              title: "Submitted",
              subtitle: "Complaint registered in the system",
              active: true,
              showLine: true,
            ),
            _timelineItem(
              title: "Under Review",
              subtitle: "Waiting for department assignment",
              active: false,
              isLast: true,
            ),
          ]

          /// ---------------- IN PROGRESS ----------------
          else
            if (step == 1) ...[
              _timelineItem(
                  title: "Submitted",
                  subtitle: "Complaint registered in the system",
                  active: true,
                  showLine: true),

              _timelineItem(
                  title: "Under Review",
                  subtitle: "Complaint assigned to department",
                  active: true,
                  showLine: true),

              _timelineItem(
                  title: "In Progress",
                  subtitle: "Work started by field team",
                  active: true,
                  showLine: true),

              _timelineItem(
                  title: "Resolution",
                  subtitle: "Expected completion date · Pending",
                  active: false,
                  isLast: true),
            ]

            /// ---------------- RESOLVED ----------------
            else
              ...[
                _timelineItem(
                    title: "Submitted",
                    subtitle: "Complaint registered in the system",
                    active: true,
                    showLine: true),

                _timelineItem(
                    title: "Under Review",
                    subtitle: "Complaint assigned to department",
                    active: true,
                    showLine: true),

                _timelineItem(
                    title: "In Progress",
                    subtitle: "Work started by field team",
                    active: true,
                    showLine: true),

                _timelineItem(
                    title: "Resolved",
                    subtitle: "Issue resolved and verified",
                    active: true,
                    isLast: true),
              ],
        ],
      ),
    );
  }

  Widget _timelineItem({
    required String title,
    required String subtitle,
    required bool active,
    bool showLine = false,
    bool isLast = false,
  }) {
    final Color color = active ? complaint.statusColor : Colors.grey.shade300;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 13,
              backgroundColor: color,
              child: Icon(
                active ? Icons.check_circle_outline : Icons.access_time,
                size: 15,
                color: active ? Colors.white : Colors.grey,
              ),
            ),

            if (!isLast)
              Container(
                width: 2,
                height: 45,
                color: showLine ? complaint.statusColor : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: active ? Colors.black : Colors.grey)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: TextStyle(
                        color:
                        active ? Colors.grey.shade700 : Colors.grey)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

class DepartmentCard extends StatelessWidget {
  final Complaint complaint;

  const DepartmentCard({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: const [
              Icon(Icons.apartment, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                "Assigned Department",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Department
          const Text(
            "Department",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            complaint.department,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 16),

          // Phone and Email
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Phone
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.phone, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    complaint.phone,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              // Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.email, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    complaint.email,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  final Complaint complaint;
  const BottomButtons({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // soft squarish corners
      ),
    );

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            style: buttonStyle,
            onPressed: () {},
            icon: const Icon(Icons.call),
            label: const Text("Call"),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            style: buttonStyle,
            onPressed: () {},
            icon: const Icon(Icons.message),
            label: const Text("Follow Up"),
          ),
        ),
      ],
    );
  }
}


