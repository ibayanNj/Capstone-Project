import 'package:flutter/material.dart';
import '../../widgets/base_dashboard.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDashboard(
      role: 'Administrator',
      userName: 'Admin User',
      sidebarItems: [
        SidebarItem(icon: Icons.dashboard, title: 'Dashboard'),
        SidebarItem(icon: Icons.supervisor_account, title: 'User Management'),
        SidebarItem(icon: Icons.settings, title: 'System Settings'),
        SidebarItem(icon: Icons.storage, title: 'Database'),
        SidebarItem(icon: Icons.security, title: 'Security'),
        SidebarItem(icon: Icons.backup, title: 'Backup'),
      ],
      pages: [
        // Pages removed as requested
      ],
    );
  }
}