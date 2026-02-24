import 'package:flutter/material.dart';
import 'package:smart_village_animated/screens/complaint_page.dart';
import 'package:smart_village_animated/screens/register_complaint_page_2.dart';
import 'package:smart_village_animated/widgets/village_header.dart';

import '../widgets/bottom_nav_bar.dart';

class RegisterComplaintPage extends StatefulWidget {
  const RegisterComplaintPage({super.key});

  @override
  State<RegisterComplaintPage> createState() => _RegisterComplaintPageState();
}

class _RegisterComplaintPageState extends State<RegisterComplaintPage>
    with SingleTickerProviderStateMixin {

  int? selectedIndex;
  int _currentIndex = 4;
  bool _isBackHovered = false;




  final List<_Category> categories = [
    _Category("Water Supply", Icons.water_drop, Colors.blue),
    _Category("Electricity", Icons.bolt, Colors.orange),
    _Category("Waste", Icons.delete, Colors.green),
    _Category("Street Lights", Icons.lightbulb, Colors.purple),
    _Category("Roads", Icons.flag, Colors.deepOrange),
    _Category("Internet", Icons.wifi, Colors.indigo),
    _Category("CCTV", Icons.camera_alt, Colors.grey),
    _Category("Transport", Icons.directions_bus, Colors.teal),
  ];

  late AnimationController glowController;
  late Animation<double> glowAnimation;

  @override
  void initState() {
    super.initState();

    glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    glowAnimation = Tween<double>(begin: 0.4, end: 1).animate(
      CurvedAnimation(parent: glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
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
                    _buildBackButton(),
                    const SizedBox(height: 12),
                    _buildTitle(),
                    const SizedBox(height: 16),
                    _buildStepIndicator(),
                    const SizedBox(height: 20),
                    _buildCategorySection(),
                    const SizedBox(height: 20),
                    _buildContinueButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 4),
    );
  }

  Widget _buildBackButton() => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _isBackHovered = true),
    onExit: (_) => setState(() => _isBackHovered = false),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ComplaintsPage(
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

  // InkWell(
  //   onTap: ()=> Navigator.pop(context),
  //   child: const Row(
  //     children:[
  //       Icon(Icons.arrow_back,size:18),
  //       SizedBox(width:6),
  //       Text("Back")
  //     ],
  //   ),
  // );


  Widget _buildTitle() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Register Complaint",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text("Help us serve you better", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      children: [
        _stepCircle("1", true),
        _stepLine(),
        _stepCircle("2", false),
        _stepLine(),
        _stepCircle("3", false),
      ],
    );
  }

  Widget _stepCircle(String text, bool active) {
    return CircleAvatar(
      radius: 14,
      backgroundColor:
      active ? const Color(0xFF1F4ED8) : Colors.grey.shade300,
      child: Text(text,
          style: TextStyle(
              color: active ? Colors.white : Colors.black54, fontSize: 12)),
    );
  }

  Widget _stepLine() =>
      Expanded(child: Container(height: 1, color: Colors.grey.shade300));

  // CATEGORY GRID
  Widget _buildCategorySection() {
    final categories = [
      _Category("Water Supply", Icons.water_drop, Colors.blue),
      _Category("Electricity", Icons.bolt, Colors.orange),
      _Category("Waste", Icons.delete, Colors.green),
      _Category("Street Lights", Icons.lightbulb, Colors.purple),
      _Category("Roads", Icons.flag, Colors.deepOrange),
      _Category("Internet", Icons.wifi, Colors.indigo),
      _Category("CCTV", Icons.camera_alt, Colors.grey),
      _Category("Transport", Icons.directions_bus, Colors.teal),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        const Text("Choose the type of complaint",
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (context, index) {
            final cat = categories[index];
            return GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
              },
              child: _categoryCard(cat, index == selectedIndex),
            );
          },
        ),
      ],
    );
  }

  Widget _categoryCard(_Category category, bool selected) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 220),
      scale: selected ? 1.05 : 1,
      curve: Curves.easeOutBack,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: selected ? const Color(0xFF1F4ED8) : Colors.grey.shade200,
              width: selected ? 2.2 : 1),
          boxShadow: selected
              ? [
            BoxShadow(
              color: const Color(0xFF1F4ED8).withOpacity(0.25),
              blurRadius: 12,
              spreadRadius: 1,
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                backgroundColor: category.color,
                child: Icon(category.icon, color: Colors.white)),
            const Spacer(),
            Text(category.title,
                style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  // CONTINUE BUTTON
  Widget _buildContinueButton() {
    final enabled = selectedIndex != null;

    return AnimatedBuilder(
      animation: glowAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: enabled
                ? [
              BoxShadow(
                color: const Color(0xFF1F4ED8)
                    .withOpacity(glowAnimation.value * 0.6),
                blurRadius: 12,
                spreadRadius: 1,
              )
            ]
                : [],
          ),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: enabled ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ComplaintDetailsPage(
                      category: categories[selectedIndex!].title,
                    ),
                  ),
                );


              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                disabledBackgroundColor: Colors.grey.shade300,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.zero,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: enabled
                      ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2563EB), // strong blue
                      Color(0xFF1E40AF), // deep blue
                    ],
                  )
                      : null,
                  color: enabled ? null : Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Center(
                  child: Text("Continue",
                      style: TextStyle(
                          color: enabled ? Colors.white : Colors.black45,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Category {
  final String title;
  final IconData icon;
  final Color color;
  _Category(this.title, this.icon, this.color);
}