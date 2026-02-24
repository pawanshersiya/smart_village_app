import 'package:flutter/material.dart';

List<Complaint> complaints = [

  Complaint(
    id: "009",
    title: "Street Light Not Working",
    description: "Light not working near house 45",
    category: "Infrastructure",
    status: "In Progress",
    date: "Jan 15, 2026",
    location: "Ward 3",
    statusColor: Color(0xFF1E88E5),
    department: "Infrastructure Department",
    phone: "+91 98765 11111",
    email: "infrastructure@village.gov",
    statusColor2: Color(0xFFDFF3FF),
  ),

  Complaint(
    id: "008",
    title: "Water Leakage",
    description: "Pipeline broken near temple",
    category: "Water Supply",
    status: "Pending",
    date: "Feb 2, 2026",
    location: "Ward 2",
    statusColor: Color(0xFFFF9800),
    department: "Water Supply Department",
    phone: "+91 98765 22222",
    email: "water@village.gov",
    statusColor2: const Color(0xFFFEF9EA),
  ),

  Complaint(
    id: "007",
    title: "Garbage Collection",
    description: "Garbage not collected for 2 days",
    category: "Sanitation",
    status: "Resolved",
    date: "Feb 1, 2026",
    location: "Market Area",
    statusColor: Color(0xFF4CAF50),
    department: "Sanitation Department",
    phone: "+91 98765 33333",
    email: "sanitation@village.gov",
    statusColor2: Color(0xFFD9F6E4),
  ),

  Complaint(
    id: "006",
    title: "Road Pothole",
    description: "Large pothole causing accidents near school",
    category: "Roads",
    status: "Pending",
    date: "Feb 5, 2026",
    location: "School Road, Ward 1",
    statusColor: Color(0xFFFF9800),
    department: "Road Maintenance Department",
    phone: "+91 98765 44444",
    email: "roads@village.gov",
    statusColor2: Color(0xFFFEF9EA),
  ),

  Complaint(
    id: "005",
    title: "Drainage Blocked",
    description: "Drain water overflowing in rainy season",
    category: "Sanitation",
    status: "In Progress",
    date: "Feb 6, 2026",
    location: "North Colony",
    statusColor: Color(0xFF1E88E5),
    department: "Sanitation Department",
    phone: "+91 98765 55555",
    email: "sanitation@village.gov",
    statusColor2: Color(0xFFDFF3FF),
  ),

  Complaint(
    id: "004",
    title: "Electric Pole Tilted",
    description: "Electric pole dangerously tilted after storm",
    category: "Electricity",
    status: "Resolved",
    date: "Feb 4, 2026",
    location: "Temple Street",
    statusColor: Color(0xFF4CAF50),
    department: "Electricity Board",
    phone: "+91 98765 66666",
    email: "electricity@village.gov",
    statusColor2: Color(0xFFD9F6E4),
  ),

  Complaint(
    id: "003",
    title: "Water Supply Low Pressure",
    description: "Very low water pressure in morning hours",
    category: "Water Supply",
    status: "In Progress",
    date: "Feb 7, 2026",
    location: "Ward 5",
    statusColor: Color(0xFF1E88E5),
    department: "Water Supply Department",
    phone: "+91 98765 77777",
    email: "water@village.gov",
    statusColor2: Color(0xFFDFF3FF),
  ),

  Complaint(
    id: "002",
    title: "Street Dogs Issue",
    description: "Stray dogs chasing children near playground",
    category: "Public Safety",
    status: "Pending",
    date: "Feb 8, 2026",
    location: "Playground Area",
    statusColor: Color(0xFFFF9800),
    department: "Municipal Safety Department",
    phone: "+91 98765 88888",
    email: "safety@village.gov",
    statusColor2: Color(0xFFFEF9EA),
  ),

  Complaint(
    id: "001",
    title: "Park Lights Damaged",
    description: "Garden lights broken and area is dark at night",
    category: "Parks & Recreation",
    status: "Resolved",
    date: "Feb 3, 2026",
    location: "Central Park",
    statusColor: Color(0xFF4CAF50),
    department: "Parks Department",
    phone: "+91 98765 99999",
    email: "parks@village.gov",
    statusColor2: Color(0xFFD9F6E4),
  ),
];


class Complaint {
  final String id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String date;
  final String location;
  final Color statusColor;
  final String department;
  final String phone;
  final String email;
  final Color statusColor2;



  Complaint({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.date,
    required this.location,
    required this.statusColor,
    required this.department,
    required this.phone,
    required this.email,
    required this.statusColor2,
  });
}