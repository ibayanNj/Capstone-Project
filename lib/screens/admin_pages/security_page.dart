import 'package:flutter/material.dart';

class AdminSecurityPage extends StatelessWidget {
  const AdminSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Security Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildSecurityStatCard('Security Score', '92%', Icons.security, Colors.green),
              const SizedBox(width: 20),
              _buildSecurityStatCard('Failed Logins', '23', Icons.warning, Colors.orange),
              const SizedBox(width: 20),
              _buildSecurityStatCard('Active Sessions', '78', Icons.computer, Colors.blue),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildSecuritySettingsCard(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildSecurityLogsCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityStatCard(String title, String value, IconData icon, Color color) {
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

  Widget _buildSecuritySettingsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Security Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Password Policy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('Require Strong Passwords', true),
            _buildSwitchSetting('Password Expiration (90 days)', false),
            _buildSwitchSetting('Account Lockout (5 attempts)', true),
            const SizedBox(height: 20),
            const Text('Session Management', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('Auto Logout (30 min)', true),
            _buildSwitchSetting('Single Sign-On', false),
            _buildSwitchSetting('Remember Me Option', true),
            const SizedBox(height: 20),
            const Text('Security Features', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('Two-Factor Authentication', false),
            _buildSwitchSetting('IP Whitelist', false),
            _buildSwitchSetting('Audit Logging', true),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Run Security Scan'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Generate Report'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityLogsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Security Events', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildSecurityEvent('Failed login attempt', 'user@university.edu', '2 min ago', 'HIGH', Colors.red),
                  _buildSecurityEvent('Successful login', 'admin@university.edu', '15 min ago', 'INFO', Colors.blue),
                  _buildSecurityEvent('Password changed', 'faculty@university.edu', '1 hour ago', 'INFO', Colors.blue),
                  _buildSecurityEvent('Multiple failed logins', '192.168.1.100', '2 hours ago', 'HIGH', Colors.red),
                  _buildSecurityEvent('Account locked', 'student@university.edu', '3 hours ago', 'MEDIUM', Colors.orange),
                  _buildSecurityEvent('Session expired', 'dean@university.edu', '4 hours ago', 'INFO', Colors.blue),
                  _buildSecurityEvent('Unauthorized access attempt', '10.0.0.50', '5 hours ago', 'CRITICAL', Colors.red),
                  _buildSecurityEvent('Security scan completed', 'System', '6 hours ago', 'INFO', Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text('Threat Analysis', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildThreatItem('Brute Force Attacks', '3 blocked today'),
            _buildThreatItem('Suspicious IPs', '2 flagged'),
            _buildThreatItem('Malware Scans', 'Clean'),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchSetting(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Switch(
            value: value,
            onChanged: (newValue) {},
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityEvent(String event, String source, String time, String severity, Color severityColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: severityColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(severity, style: TextStyle(color: severityColor, fontSize: 9)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
                Text('$source • $time', style: TextStyle(color: Colors.grey[600], fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreatItem(String threat, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(threat, style: const TextStyle(fontSize: 12)),
          Text(status, style: TextStyle(color: Colors.grey[600], fontSize: 11)),
        ],
      ),
    );
  }
}