import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_village_animated/widgets/village_header.dart';
import 'complaint_page.dart';

class ComplaintSuccessPage extends StatefulWidget {
  const ComplaintSuccessPage({super.key});

  @override
  State<ComplaintSuccessPage> createState() => _ComplaintSuccessPageState();
}

class _ComplaintSuccessPageState extends State<ComplaintSuccessPage>
    with TickerProviderStateMixin {

  late AnimationController circleController;
  late AnimationController textController;
  late AnimationController bgController;

  late Animation<double> scaleAnim;
  late Animation<double> fadeText;
  late Animation<Offset> slideText;
  late Animation<double> bgAnim;

  @override
  void initState() {
    super.initState();

    // circle pop
    circleController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900));

    scaleAnim = CurvedAnimation(parent: circleController, curve: Curves.elasticOut);

    // text animation
    textController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    fadeText = Tween(begin: 0.0, end: 1.0).animate(textController);
    slideText =
        Tween(begin: const Offset(0, .5), end: Offset.zero).animate(textController);

    // breathing background
    bgController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);

    bgAnim = Tween(begin: .95, end: 1.05).animate(bgController);

    startAnimation();

    // AUTO REDIRECT
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const ComplaintsPage()),
                (route) => false);
      }
    });
  }

  Future<void> startAnimation() async {
    await circleController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    textController.forward();
  }

  @override
  void dispose() {
    circleController.dispose();
    textController.dispose();
    bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VillageHeader(
            title: "Gram Setu",
            subtitle: "Green Valley",
          ),
      Expanded(
        child: AnimatedBuilder(
        animation: bgAnim,
        builder: (context, _) {
          return Transform.scale(
            scale: bgAnim.value,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE8F5F1), Color(0xFFDFF3EC)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Animated Circle
                    ScaleTransition(
                      scale: scaleAnim,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFF19C37D), Color(0xFF00A86B)],
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x5519C37D),
                                blurRadius: 25,
                                spreadRadius: 6)
                          ],
                        ),
                        child: const Icon(Icons.check,
                            color: Colors.white, size: 55),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Animated Text
                    FadeTransition(
                      opacity: fadeText,
                      child: SlideTransition(
                        position: slideText,
                        child: const Column(
                          children: [
                            Text(
                              "Complaint Submitted!",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F2A37)),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Your complaint has been registered successfully",
                              style: TextStyle(color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // loading indicator
                    const SizedBox(
                      width: 26,
                      height: 26,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Color(0xFF00A86B),
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Text("Redirecting...",
                        style: TextStyle(color: Colors.black54))
                  ],
                ),
              ),
            ),
          );
        },
      ),
      ),
    ],
   ),
  );
 }
}