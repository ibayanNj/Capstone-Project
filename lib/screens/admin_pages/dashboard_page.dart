import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'System Overview',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildStatCard('Total Users', '243', Icons.people, Colors.blue),
              const SizedBox(width: 20),
              _buildStatCard('Active Sessions', '78', Icons.computer, Colors.green),
              const SizedBox(width: 20),
              _buildStatCard('System Health', '98%', Icons.health_and_safety, Colors.orange),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildSystemLogsCard()),
                const SizedBox(width: 20),
                Expanded(child: _buildMaintenanceCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(title, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSystemLogsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recent System Logs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildLogItem('User login successful', 'INFO', '2 min ago'),
                  _buildLogItem('Database backup completed', 'SUCCESS', '1 hour ago'),
                  _buildLogItem('Failed login attempt', 'WARNING', '3 hours ago'),
                  _buildLogItem('System update installed', 'INFO', '5 hours ago'),
                  _buildLogItem('New user registered', 'INFO', '6 hours ago'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaintenanceCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Maintenance Tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildMaintenanceItem('Weekly backup', 'Scheduled for tonight'),
                  _buildMaintenanceItem('System update', 'Available'),
                  _buildMaintenanceItem('Database cleanup', 'In progress'),
                  _buildMaintenanceItem('Security scan', 'Completed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogItem(String message, String level, String time) {
    Color levelColor = level == 'SUCCESS' ? Colors.green : 
                      level == 'WARNING' ? Colors.orange : Colors.blue;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: levelColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(level, style: TextStyle(color: levelColor, fontSize: 10)),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(message, style: const TextStyle(fontSize: 12))),
          Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildMaintenanceItem(String task, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.build, size: 16, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(child: Text(task)),
          Text(status, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }
}