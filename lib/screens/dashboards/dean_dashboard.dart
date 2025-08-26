import 'package:flutter/material.dart';
import '../../widgets/base_dashboard.dart';
import '../dean_pages/dashboard_page.dart';
import '../dean_pages/faculty_management_page.dart';
import '../dean_pages/evaluation_reports_page.dart';
// Removed unused imports for Departments, Analytics (separate page), and Calendar

class DeanDashboard extends StatelessWidget {
  const DeanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      role: 'Dean',
      userName: 'Ma Concepcion Vera',
      sidebarItems: [
        SidebarItem(icon: Icons.dashboard, title: 'Dashboard'),
        SidebarItem(icon: Icons.people, title: 'Faculty Management'),
        SidebarItem(icon: Icons.assessment, title: 'Evaluation Reports'),
        SidebarItem(icon: Icons.rate_review, title: 'New Evaluation'),
        SidebarItem(icon: Icons.analytics, title: 'Analytics'),
      ],
      pages: [
        const DeanDashboardPage(),
        const DeanFacultyManagementPage(),
        const DeanEvaluationReportsPage(),
        const EvaluationFormView(),
        const DataAnalyticsView(),
      ],
    );
  }
}