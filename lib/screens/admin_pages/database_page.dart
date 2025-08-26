import 'package:flutter/material.dart';

class AdminDatabasePage extends StatelessWidget {
  const AdminDatabasePage({super.key});

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
              const Text('Database Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh Status'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildDbStatCard('Database Size', '2.4 GB', Icons.storage, Colors.blue),
              const SizedBox(width: 20),
              _buildDbStatCard('Total Records', '15,847', Icons.table_chart, Colors.green),
              const SizedBox(width: 20),
              _buildDbStatCard('Connection Status', 'Active', Icons.link, Colors.orange),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildDatabaseOperationsCard(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildTableStatusCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDbStatCard(String title, String value, IconData icon, Color color) {
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

  Widget _buildDatabaseOperationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Database Operations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildOperationButton('Backup Database', Icons.backup, Colors.blue),
            const SizedBox(height: 10),
            _buildOperationButton('Restore Database', Icons.restore, Colors.green),
            const SizedBox(height: 10),
            _buildOperationButton('Optimize Tables', Icons.tune, Colors.orange),
            const SizedBox(height: 10),
            _buildOperationButton('Export Data', Icons.download, Colors.purple),
            const SizedBox(height: 10),
            _buildOperationButton('Import Data', Icons.upload, Colors.teal),
            const SizedBox(height: 30),
            const Text('Recent Backups', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildBackupItem('Full Backup', '2023-12-10 02:00 AM', '2.4 GB', 'Success'),
                  _buildBackupItem('Incremental Backup', '2023-12-09 02:00 AM', '156 MB', 'Success'),
                  _buildBackupItem('Full Backup', '2023-12-03 02:00 AM', '2.3 GB', 'Success'),
                  _buildBackupItem('Full Backup', '2023-11-26 02:00 AM', '2.2 GB', 'Failed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Table Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildTableItem('users', '243 rows', '45 MB', 'Healthy'),
                  _buildTableItem('evaluations', '1,847 rows', '234 MB', 'Healthy'),
                  _buildTableItem('courses', '156 rows', '12 MB', 'Healthy'),
                  _buildTableItem('departments', '12 rows', '2 MB', 'Healthy'),
                  _buildTableItem('feedback', '3,456 rows', '89 MB', 'Needs Optimization'),
                  _buildTableItem('sessions', '789 rows', '23 MB', 'Healthy'),
                  _buildTableItem('audit_logs', '9,234 rows', '156 MB', 'Healthy'),
                  _buildTableItem('system_config', '45 rows', '1 MB', 'Healthy'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Database Health: 95%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.95,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationButton(String title, IconData icon, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: color.withOpacity(0.1),
          foregroundColor: color,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildBackupItem(String type, String date, String size, String status) {
    Color statusColor = status == 'Success' ? Colors.green : Colors.red;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            status == 'Success' ? Icons.check_circle : Icons.error,
            color: statusColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
                Text('$date • $size', style: TextStyle(color: Colors.grey[600], fontSize: 10)),
              ],
            ),
          ),
          Text(status, style: TextStyle(color: statusColor, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildTableItem(String tableName, String rows, String size, String status) {
    Color statusColor = status == 'Healthy' ? Colors.green : Colors.orange;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(Icons.table_chart, color: Colors.blue[600], size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tableName, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                Text('$rows • $size', style: TextStyle(color: Colors.grey[600], fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(status, style: TextStyle(color: statusColor, fontSize: 10)),
          ),
        ],
      ),
    );
  }
}