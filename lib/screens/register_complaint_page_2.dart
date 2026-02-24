import 'package:flutter/material.dart';
import 'package:smart_village_animated/screens/register_complaint_page_3.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/village_header.dart';
import 'complaint_page.dart';

class ComplaintDetailsPage extends StatefulWidget {
  final String category;

  const ComplaintDetailsPage({super.key, required this.category});

  @override
  State<ComplaintDetailsPage> createState() => _ComplaintDetailsPageState();
}

class _ComplaintDetailsPageState extends State<ComplaintDetailsPage> {

  final titleController = TextEditingController();
  final locationController = TextEditingController();

  int currentIndex = 5;

  bool _isBackHovered = false;

  String priority = "Medium";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body:
        Column(
          children: [
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

                    _back(),
                    const SizedBox(height: 12),

                    _topCard(),
                    const SizedBox(height: 20),

                    _sectionTitle(
                        "Basic Details", "Provide complaint information"),
                    const SizedBox(height: 12),

                    _selectedCategory(),
                    const SizedBox(height: 14),

                    _input(
                        "Complaint Title *", "Brief description of the issue",
                        titleController),
                    const SizedBox(height: 14),

                    _input("Location *", "Where is the issue located?",
                        locationController),
                    const SizedBox(height: 18),

                    const Text("Priority Level",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),

                    _prioritySelector(),

                    const SizedBox(height: 24),

                    _buttons(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }

  Widget _back() =>
      MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isBackHovered = true),
        onExit: (_) => setState(() => _isBackHovered = false),
        child: InkWell(
          onTap: () =>
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ComplaintsPage(
                      ),
                ),
              ),
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
      );


  Widget _title() =>
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Register Complaint",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Help us serve you better",
              style: TextStyle(color: Colors.grey)),
        ],
      );

  Widget _stepIndicator() {
    return Row(
      children: [
        _circle("1", true),
        _line(true),
        _circle("2", true),
        _line(false),
        _circle("3", false),
      ],
    );
  }

  Widget _circle(String t, bool active) =>
      Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? const Color(0xFF2F6BFF) : const Color(0xFFE0E0E0),
        ),
        child: Text(t,
            style: TextStyle(
                color: active ? Colors.white : Colors.black54,
                fontWeight: FontWeight.w600)),
      );

  Widget _line(bool active) =>
      Expanded(
        child: Container(
          height: 3,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF2F6BFF) : const Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );


  Widget _topCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(height: 14),
          _stepIndicator(),
        ],
      ),
    );
  }

  Widget _sectionTitle(String t, String s) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t, style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(s, style: const TextStyle(color: Colors.grey)),
        ],
      );

  Widget _selectedCategory() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD9E2EC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Selected Category",
              style: TextStyle(fontSize: 13, color: Colors.black54)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.local_offer_outlined,
                  color: Color(0xFF2F6BFF), size: 18),
              const SizedBox(width: 8),
              Text(widget.category,
                  style: const TextStyle(
                      color: Color(0xFF2F6BFF),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _input(String label, String hint, TextEditingController c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black87)),
        const SizedBox(height: 6),
        TextField(
          controller: c,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF1F3F5),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }


  Widget _prioritySelector() {
    return Row(
      children: [
        _priorityCard("Low", Colors.green),
        const SizedBox(width: 10),
        _priorityCard("Medium", Colors.orange),
        const SizedBox(width: 10),
        _priorityCard("High", Colors.red),
      ],
    );
  }

  Widget _priorityCard(String label, Color color) {
    final selected = priority == label;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => priority = label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: selected ? const Color(0xFF2F6BFF) : Colors.grey
                    .shade300,
                width: selected ? 2 : 1),
            boxShadow: selected
                ? [
              BoxShadow(
                color: const Color(0xFF2F6BFF).withValues(alpha: .18),
                blurRadius: 12,
              )
            ]
                : [],
          ),
          child: Column(
            children: [
              Text(label,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              const SizedBox(height: 6),
              Text(
                label == "Low"
                    ? "Minor issue"
                    : label == "Medium"
                    ? "Needs attention"
                    : "Urgent issue",
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _buttons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: BorderSide(color: Colors.grey.shade300),
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Back"),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // gradient: const LinearGradient(
              //   colors: [Color(0xFF7EA6FF), Color(0xFF5EC6D6)],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2563EB), // strong blue
                      Color(0xFF1E40AF), // deep blue
                    ],
                  ),
                ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ComplaintAdditionalDetailsPage(
                      category: widget.category,
                      title: titleController.text,
                      location: locationController.text,
                      priority: priority,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Continue",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ],
    );
  }
}
