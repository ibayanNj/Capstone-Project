import 'package:flutter/material.dart';

class AdminSystemSettingsPage extends StatelessWidget {
  const AdminSystemSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('System Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildGeneralSettingsCard(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildNotificationSettingsCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralSettingsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('General Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildSettingItem('System Name', 'Faculty Evaluation System'),
            _buildSettingItem('Academic Year', '2023-2024'),
            _buildSettingItem('Semester', 'Fall 2023'),
            _buildSettingItem('Time Zone', 'UTC-5 (Eastern Time)'),
            _buildSettingItem('Language', 'English'),
            const SizedBox(height: 20),
            const Text('Evaluation Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('Enable Student Evaluations', true),
            _buildSwitchSetting('Enable Peer Reviews', true),
            _buildSwitchSetting('Anonymous Feedback', false),
            _buildSwitchSetting('Auto-Generate Reports', true),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSettingsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Notification Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Email Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('New User Registration', true),
            _buildSwitchSetting('Evaluation Submissions', true),
            _buildSwitchSetting('System Maintenance', false),
            _buildSwitchSetting('Security Alerts', true),
            const SizedBox(height: 20),
            const Text('System Alerts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('Database Backup Status', true),
            _buildSwitchSetting('Server Performance', false),
            _buildSwitchSetting('Failed Login Attempts', true),
            const SizedBox(height: 20),
            const Text('SMTP Configuration', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSettingItem('SMTP Server', 'smtp.university.edu'),
            _buildSettingItem('Port', '587'),
            _buildSettingItem('Username', 'system@university.edu'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Test Email Configuration'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(color: Colors.grey[600])),
        ],
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
}