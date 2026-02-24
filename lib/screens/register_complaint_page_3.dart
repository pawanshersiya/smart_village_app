import 'package:flutter/material.dart';
import 'package:smart_village_animated/screens/register_complaint_page_4.dart';
import 'package:smart_village_animated/data/complaint_list.dart';
import '../widgets/village_header.dart';
import 'complaint_page.dart';
import 'package:intl/intl.dart';

class ComplaintAdditionalDetailsPage extends StatefulWidget {
  final String category;
  final String title;
  final String location;
  final String priority;

  const ComplaintAdditionalDetailsPage({
    super.key,
    required this.category,
    required this.title,
    required this.location,
    required this.priority,
  });

  @override
  State<ComplaintAdditionalDetailsPage> createState() =>
      _ComplaintAdditionalDetailsPageState();
}

class _ComplaintAdditionalDetailsPageState
    extends State<ComplaintAdditionalDetailsPage> {

  final descriptionController = TextEditingController();
  final contactController = TextEditingController();

  bool isValid = false;
  bool _isBackHovered = false;


  @override
  void initState() {
    super.initState();
    descriptionController.addListener(validate);
    contactController.addListener(validate);
  }

  void validate() {
    final ok = descriptionController.text.trim().isNotEmpty &&
        contactController.text.trim().length >= 10;

    if (ok != isValid) {
      setState(() => isValid = ok);
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body:
        Column(
          children: [
            /// HEADER
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

                      Row(
                        children: [
                          _back(),
                        ],
                      ),
                      const SizedBox(height: 12),

                      _topCard(),
                      const SizedBox(height: 18),

                      const Text("Additional Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const Text("Complete your complaint",
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 14),

                      _input("Description *",
                          "Provide detailed information about the issue. Include when it started, how it affects you, and any other relevant details.",
                          descriptionController,
                          maxLines: 4),

                      const SizedBox(height: 14),

                      _input("Contact Number *",
                          "Your contact number for updates",
                          contactController),

                      const SizedBox(height: 18),

                      _summaryCard(),

                      const SizedBox(height: 24),

                      _buttons(),
                    ]),
              ),
            )
          ],
        ),
    );
  }

  Widget _topCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Register Complaint",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("Help us serve you better",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 14),

          Row(
            children: [
              _circle("1", true),
              _line(true),
              _circle("2", true),
              _line(true),
              _circle("3", true),
            ],
          )
        ],
      ),
    );
  }

  Widget _circle(String t, bool active) => Container(
    width: 28,
    height: 28,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: active ? const Color(0xFF2F6BFF) : Colors.grey.shade300,
    ),
    child: Text(t,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
  );

  Widget _line(bool active) => Expanded(
    child: Container(
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      color: active ? const Color(0xFF2F6BFF) : Colors.grey.shade300,
    ),
  );

  Widget _input(String label, String hint, TextEditingController c,
      {int maxLines = 1}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      const SizedBox(height: 6),
      TextField(
        controller: c,
        maxLines: maxLines,
        keyboardType:
        label.contains("Contact") ? TextInputType.phone : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF1F3F5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    ]);
  }

  Widget _summaryCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: const Color(0xFFE8F2F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Summary",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        _row("Category:", widget.category),
        _row("Title:", widget.title),
        _row("Location:", widget.location),
        _row("Priority:", widget.priority),
      ]),
    );
  }

  Widget _row(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(k, style: const TextStyle(color: Colors.black54)),
        Text(v, style: const TextStyle(fontWeight: FontWeight.w600)),
      ]),
    );
  }

  Widget _buttons() {
    return Row(children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Back"),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: ElevatedButton(
          onPressed: isValid
              ? () {
            // 🔹 Create new complaint
            Complaint newComplaint = Complaint(
              id: (complaints.length + 1).toString().padLeft(3, '0'),
              title: widget.title,
              description: descriptionController.text,
              category: widget.category,
              status: "Pending",
              date: DateFormat('MMM dd, yyyy').format(DateTime.now()),
              location: widget.location,
              statusColor: const Color(0xFFFF9800),
              department: "${widget.category} Department",
              phone: contactController.text,
              email: "${widget.category.toLowerCase()}@village.gov",
              statusColor2: const Color(0xFFFEF9EA),
            );

            // 🔹 Add to global list
            complaints.insert(0, newComplaint);

            // 🔹 Go to success page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => const ComplaintSuccessPage()),
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: const Color(0xFF5EC6D6),
          ),
          child: const Text("Submit Complaint"),
        ),
      )
    ]);
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
                      ComplaintsPage(),
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
}
