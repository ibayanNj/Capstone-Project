import 'package:flutter/material.dart';
import '../../widgets/base_dashboard.dart';
import '../faculty_pages/dashboard_page.dart';
import '../faculty_pages/evaluations_page.dart';
import '../faculty_pages/classes_page.dart';
import '../faculty_pages/schedule_page.dart';

class FacultyDashboard extends StatelessWidget {
  const FacultyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      role: 'Faculty',
      userName: 'Prof. Mary Johnson',
      sidebarItems: [
        SidebarItem(icon: Icons.dashboard, title: 'Dashboard'),
        SidebarItem(icon: Icons.rate_review, title: 'My Evaluations'),
        SidebarItem(icon: Icons.class_, title: 'My Classes'),
        SidebarItem(icon: Icons.schedule, title: 'Schedule'),
      ],
      pages: [
        const FacultyDashboardPage(),
        const FacultyEvaluationsPage(),
        const FacultyClassesPage(),
        const FacultySchedulePage(),
      ],
    );
  }
}