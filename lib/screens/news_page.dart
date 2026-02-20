import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'news_details_page.dart';
import 'package:smart_village_animated/widgets/village_header.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _currentIndex = 2;

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


            // const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [

                /// ANNOUNCEMENTS TITLE
                Text(
                  "Announcements",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Stay updated with village news",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 16),

                /// CARDS
                _AnnouncementCard(
                  type: "Event",
                  typeColor: Colors.purple,
                  title: "Health Camp Organized",
                  description:
                  "Free health check-up camp for all residents by the village council",
                  date: "Jan 22, 2026",
                  footerLeft: "Health Department",
                  footerRight: "Primary Health Center",

                  intro:
                  "Free Health Check-up Camp for All Residents",
                  fullDetails:
                  "Available Services:\n"
                      "• General health check-up\n"
                      "• Blood pressure monitoring\n"
                      "• Blood sugar testing\n"
                      "• BMI and weight check\n"
                      "• Doctor consultation\n"
                      "• Medicine distribution (if required)\n\n"
                      "Who Should Attend:\n"
                      "• Senior citizens (60+ years)\n"
                      "• Pregnant women\n"
                      "• Chronic disease patients\n"
                      "• Anyone concerned about their health",
                  location: "Primary Health Center",
                  organizedBy: "Health Department",
                  phone: "+91 98765 43210",
                  time: "09:00 AM - 04:00 PM",
                ),

                _AnnouncementCard(
                  type: "Alert",
                  typeColor: Colors.deepOrangeAccent,
                  title: "Water Supply Maintenance",
                  description:
                  "Routine maintenance on the main water pipeline affecting supply.",
                  date: "Jan 20, 2026",
                  footerLeft: "Water Department",
                  footerRight: "Affected Areas",

                  intro:
                  "Important Notice: Water Supply Maintenance",

                  fullDetails:
                  "The village water department will conduct routine maintenance on the main water pipeline. "
                      "This is necessary to ensure continued quality water supply to all residents.\n\n"
                      "Affected Areas:\n"
                      "• Ward 1 - Complete area\n"
                      "• Ward 2 - Sectors A, B, C\n"
                      "• Ward 3 - Near community center\n\n"
                      "During this time, please:\n"
                      "• Store sufficient water for your needs\n"
                      "• Keep taps closed to prevent water wastage when supply resumes\n"
                      "• Report any leakage or issues to the water department\n\n"
                      "We apologize for any inconvenience caused and appreciate your cooperation.",

                  location: "Main Water Pipeline Area",
                  organizedBy: "Water Department",
                  phone: "Water Dept: +91 98765 11111",
                  time: "10:00 AM - 2:00 PM",
                ),

                _AnnouncementCard(
                  type: "Event",
                  typeColor: Colors.purple,
                  title: "Village Council Meeting",
                  description:
                  "Monthly village council meeting to discuss important community matters.",
                  date: "Jan 25, 2026",
                  footerLeft: "Village Council",
                  footerRight: "Community Hall",

                  intro:
                  "Join us for the Monthly Village Council Meeting",

                  fullDetails:
                  "Agenda:\n"
                      "• Infrastructure development projects for 2026\n"
                      "• Budget allocation and financial planning\n"
                      "• Road maintenance schedule\n"
                      "• Water supply improvements\n"
                      "• Community feedback and suggestions\n\n"
                      "All residents are encouraged to attend and participate in the discussion. "
                      "Your voice matters in shaping our village's future.\n\n"
                      "Please bring any documents or concerns you wish to raise during the meeting.",

                  location: "Community Hall",
                  organizedBy: "Village Council",
                  phone: "Sarpanch Office: +91 98765 43210",
                  time: "10:00 AM - 12:00 PM",
                ),

                _AnnouncementCard(
                  type: "Info",
                  typeColor: Colors.orange,
                  title: "Updated Ration Card Guidelines",
                  description:
                  "New guidelines issued for ration card applications and updates.",
                  date: "Feb 7, 2026",
                  footerLeft: "Food & Civil Supplies",
                  footerRight: "Residents",

                  intro:
                  "Important Information: Ration Card Guidelines",

                  fullDetails:
                  "The Food & Civil Supplies Department has issued updated guidelines for ration card services.\n\n"
                      "Key Changes:\n"
                      "• Aadhaar linking mandatory\n"
                      "• Income certificate required\n"
                      "• Online application encouraged\n\n"
                      "Please ensure all documents are updated to avoid service disruption.",

                  location: "Ration Office",
                  organizedBy: "Food & Civil Supplies Dept",
                  phone: "Ration Office: +91 98765 88888",
                  time: "Office Hours",
                ),

                _AnnouncementCard(
                  type: "Update",
                  typeColor: Colors.green,
                  title: "Road Repair Work Completed",
                  description:
                  "Road repair work on East Avenue has been completed successfully.",
                  date: "Jan 16, 2026",
                  footerLeft: "Public Works",
                  footerRight: "East Avenue",

                  intro:
                  "Road Repair Work Successfully Completed",

                  fullDetails:
                  "We are pleased to announce that the road repair work on East Avenue has been completed ahead of schedule.\n\n"
                      "Work Completed:\n"
                      "• Complete resurfacing of 2.5 km road\n"
                      "• New drainage system installed\n"
                      "• Speed breakers added near school zone\n"
                      "• Road markings and signage updated\n"
                      "• Street lights repaired\n\n"
                      "The new road surface will significantly improve:\n"
                      "• Vehicle safety\n"
                      "• Reduced travel time\n"
                      "• Better water drainage during monsoon\n"
                      "• Overall commuter experience\n\n"
                      "Thank you to all residents for your patience and cooperation during the construction period. "
                      "We hope this improvement enhances your daily commute.",

                  location: "East Avenue",
                  organizedBy: "Public Works",
                  phone: "Public Works: +91 98765 33333",
                  time: "Completed",
                ),

                _AnnouncementCard(
                  type: "Notice",
                  typeColor: Colors.blue,
                  title: "Vaccination Drive",
                  description:
                  "COVID-19 booster vaccination drive for all eligible residents.",
                  date: "Jan 28, 2026",
                  footerLeft: "Health Department",
                  footerRight: "Primary Health Center",

                  intro:
                  "COVID-19 Booster Vaccination Drive",

                  fullDetails:
                  "The health department is organizing a booster vaccination drive for all eligible residents as per government guidelines.\n\n"
                      "Eligibility:\n"
                      "• Adults who completed primary vaccination 6+ months ago\n"
                      "• Senior citizens (60+ years)\n"
                      "• Healthcare workers\n"
                      "• Frontline workers\n\n"
                      "Registration Process:\n"
                      "1. Visit Primary Health Center\n"
                      "2. Bring your vaccination certificate\n"
                      "3. Carry Aadhaar card for verification\n"
                      "4. Fill the consent form\n\n"
                      "Available Vaccines:\n"
                      "• Covishield\n"
                      "• Covaxin\n\n"
                      "Please note: Walk-in registrations may have limited slots. "
                      "We recommend pre-registration for guaranteed vaccination.",

                  location: "Primary Health Center",
                  organizedBy: "Health Department",
                  phone: "Health Dept: +91 98765 22222",
                  time: "09:00 AM - 5:00 PM",
                ),

                _AnnouncementCard(
                  type: "Event",
                  typeColor: Colors.purple,
                  title: "Solid Waste Management Workshop",
                  description:
                  "Workshop on effective waste management techniques for a cleaner village.",
                  date: "Feb 1, 2026",
                  footerLeft: "Ecology Department",
                  footerRight: "Community Center",

                  intro:
                  "Solid Waste Management Workshop",

                  fullDetails:
                  "Learn effective waste management techniques to keep our village clean and contribute to a healthier environment.\n\n"
                      "Workshop Topics:\n"
                      "• Waste segregation (Wet, Dry, Hazardous)\n"
                      "• Home composting methods\n"
                      "• Reducing plastic usage\n"
                      "• Recycling and reusing materials\n"
                      "• Creating organic fertilizer from kitchen waste\n\n"
                      "Benefits:\n"
                      "• Reduce household waste by 50%\n"
                      "• Create free organic fertilizer for gardens\n"
                      "• Contribute to a cleaner environment\n"
                      "• Save money on waste disposal\n\n"
                      "What to Bring:\n"
                      "• Notebook for taking notes\n"
                      "• Questions about waste management\n"
                      "• Family members (all are welcome)\n\n"
                      "Expert speakers from the Environment Department will conduct hands-on demonstrations. "
                      "Refreshments will be provided.",

                  location: "Community Center",
                  organizedBy: "Environment Department",
                  phone: "Env Dept: +91 98765 44444",
                  time: "03:00 PM - 5:00 PM",
                ),

                _AnnouncementCard(
                  type: "Alert",
                  typeColor: Colors.redAccent,
                  title: "Electricity Supply Interruption",
                  description:
                  "Scheduled power shutdown due to transformer maintenance.",
                  date: "Feb 3, 2026",
                  footerLeft: "Electricity Department",
                  footerRight: "Affected Wards",

                  intro:
                  "Important Alert: Electricity Supply Interruption",

                  fullDetails:
                  "The electricity department will carry out maintenance work on the main transformer.\n\n"
                      "Affected Areas:\n"
                      "• Ward 4 – Complete area\n"
                      "• Ward 5 – Market road\n\n"
                      "During this period:\n"
                      "• Please switch off electrical appliances\n"
                      "• Use backup power if required\n\n"
                      "We regret the inconvenience caused and appreciate your cooperation.",

                  location: "Main Transformer Area",
                  organizedBy: "Electricity Department",
                  phone: "Electricity Dept: +91 98765 55555",
                  time: "09:00 AM - 1:00 PM",
                ),

                _AnnouncementCard(
                  type: "Update",
                  typeColor: Colors.green,
                  title: "Street Light Repair Completed",
                  description:
                  "Street light repairs successfully completed across multiple wards.",
                  date: "Feb 6, 2026",
                  footerLeft: "Public Works",
                  footerRight: "Village Roads",

                  intro:
                  "Street Light Maintenance Update",

                  fullDetails:
                  "Street light repair and replacement work has been completed successfully.\n\n"
                      "Work Highlights:\n"
                      "• 35 faulty lights repaired\n"
                      "• 12 new LED lights installed\n"
                      "• Improved night-time visibility\n\n"
                      "Residents are requested to report any non-functional lights.",

                  location: "All Wards",
                  organizedBy: "Public Works Department",
                  phone: "PWD: +91 98765 77777",
                  time: "Completed",
                ),

                _AnnouncementCard(
                  type: "Notice",
                  typeColor: Colors.deepPurple,
                  title: "Garbage Collection Timing Changed",
                  description:
                  "Daily waste collection timing has been revised for improved efficiency.",
                  date: "Feb 8, 2026",
                  footerLeft: "Sanitation Department",
                  footerRight: "All Residents",

                  intro:
                  "Notice: Garbage Collection Timing Update",

                  fullDetails:
                  "The daily garbage collection timing has been revised to improve efficiency.\n\n"
                      "New Timings:\n"
                      "• Morning: 7:00 AM – 10:00 AM\n\n"
                      "Residents are requested to place waste outside their homes only during the collection time.",

                  location: "Entire Village",
                  organizedBy: "Sanitation Department",
                  phone: "Sanitation Dept: +91 98765 99999",
                  time: "Daily",
                ),
              ],
            ),
          ),
        ],
    ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
 }
}


/// 🔹 ANNOUNCEMENT CARD
class _AnnouncementCard extends StatelessWidget {
  final String type;
  final Color typeColor;
  final String title;
  final String description;
  final String date;
  final String footerLeft;
  final String? footerRight;

  // Detail page data
  final String intro;
  final String fullDetails;
  final String location;
  final String organizedBy;
  final String phone;
  final String time;

  const _AnnouncementCard({
    required this.type,
    required this.typeColor,
    required this.title,
    required this.description,
    required this.date,
    required this.footerLeft,
    required this.footerRight,

    // detail
    required this.intro,
    required this.fullDetails,
    required this.location,
    required this.organizedBy,
    required this.phone,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AnnouncementDetailPage(
              title: title,
              date: date,
              time: time,
              intro: intro,
              fullDetails: fullDetails,
              location: location,
              organizedBy: organizedBy,
              phone: phone,
              badgeColor: typeColor,
              type: type,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 160   ,
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                // border: Border(
                //   left: BorderSide(width: 4, color: typeColor),
                // ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: typeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            type,
                            style: TextStyle(
                              color: typeColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(date,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(description,
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.person,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(footerLeft,
                            style: const TextStyle(color: Colors.grey)),
                        if (footerRight != null) ...[
                          const SizedBox(width: 12),
                          const Icon(Icons.location_on,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(footerRight!,
                              style:
                              const TextStyle(color: Colors.grey)),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
