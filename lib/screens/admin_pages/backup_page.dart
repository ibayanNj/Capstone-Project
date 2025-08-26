import 'package:flutter/material.dart';

class AdminBackupPage extends StatelessWidget {
  const AdminBackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Backup Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.backup),
                    label: const Text('Create Backup'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.schedule),
                    label: const Text('Schedule Backup'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildBackupStatCard('Total Backups', '47', Icons.backup, Colors.blue),
              const SizedBox(width: 20),
              _buildBackupStatCard('Storage Used', '12.4 GB', Icons.storage, Colors.green),
              const SizedBox(width: 20),
              _buildBackupStatCard('Last Backup', '2 hours ago', Icons.access_time, Colors.orange),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildBackupHistoryCard(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildBackupSettingsCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackupStatCard(String title, String value, IconData icon, Color color) {
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

  Widget _buildBackupHistoryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Backup History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildBackupHistoryItem('Full System Backup', '2023-12-10 02:00 AM', '2.4 GB', 'Completed', Colors.green),
                  _buildBackupHistoryItem('Database Backup', '2023-12-10 01:30 AM', '1.2 GB', 'Completed', Colors.green),
                  _buildBackupHistoryItem('Incremental Backup', '2023-12-09 02:00 AM', '156 MB', 'Completed', Colors.green),
                  _buildBackupHistoryItem('Full System Backup', '2023-12-03 02:00 AM', '2.3 GB', 'Completed', Colors.green),
                  _buildBackupHistoryItem('Database Backup', '2023-12-02 02:00 AM', '1.1 GB', 'Failed', Colors.red),
                  _buildBackupHistoryItem('Full System Backup', '2023-11-26 02:00 AM', '2.2 GB', 'Completed', Colors.green),
                  _buildBackupHistoryItem('Incremental Backup', '2023-11-25 02:00 AM', '145 MB', 'Completed', Colors.green),
                  _buildBackupHistoryItem('Database Backup', '2023-11-24 02:00 AM', '1.0 GB', 'Completed', Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackupSettingsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Backup Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Automatic Backups', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSwitchSetting('Enable Auto Backup', true),
            _buildSwitchSetting('Daily Full Backup', false),
            _buildSwitchSetting('Weekly Full Backup', true),
            _buildSwitchSetting('Incremental Backup', true),
            const SizedBox(height: 20),
            const Text('Backup Schedule', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildScheduleItem('Full Backup', 'Every Sunday at 2:00 AM'),
            _buildScheduleItem('Database Backup', 'Daily at 1:30 AM'),
            _buildScheduleItem('Incremental Backup', 'Every 6 hours'),
            const SizedBox(height: 20),
            const Text('Retention Policy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildRetentionItem('Daily Backups', 'Keep for 30 days'),
            _buildRetentionItem('Weekly Backups', 'Keep for 12 weeks'),
            _buildRetentionItem('Monthly Backups', 'Keep for 12 months'),
            const SizedBox(height: 20),
            const Text('Storage Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildStorageItem('Local Storage', '/backup/local', '8.2 GB used'),
            _buildStorageItem('Cloud Storage', 'AWS S3 Bucket', '4.2 GB used'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Test Backup System'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackupHistoryItem(String type, String date, String size, String status, Color statusColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.1),
          child: Icon(
            status == 'Completed' ? Icons.check_circle : Icons.error,
            color: statusColor,
            size: 20,
          ),
        ),
        title: Text(type, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        subtitle: Text('$date • $size'),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'restore', child: Text('Restore')),
            const PopupMenuItem(value: 'download', child: Text('Download')),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
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

  Widget _buildScheduleItem(String type, String schedule) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.schedule, size: 16, color: Colors.blue[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                Text(schedule, style: TextStyle(color: Colors.grey[600], fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRetentionItem(String type, String policy) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type, style: const TextStyle(fontSize: 12)),
          Text(policy, style: TextStyle(color: Colors.grey[600], fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildStorageItem(String location, String path, String usage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.folder, size: 16, color: Colors.orange[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                Text('$path • $usage', style: TextStyle(color: Colors.grey[600], fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}