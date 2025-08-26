import 'package:flutter/material.dart';

class AdminUserManagementPage extends StatelessWidget {
  const AdminUserManagementPage({super.key});

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
              const Text('User Management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Add User'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload),
                    label: const Text('Import Users'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildUserStatCard('Total Users', '243', Icons.people, Colors.blue),
              const SizedBox(width: 20),
              _buildUserStatCard('Active Users', '189', Icons.person_outline, Colors.green),
              const SizedBox(width: 20),
              _buildUserStatCard('Pending Approval', '12', Icons.pending, Colors.orange),
            ],
          ),
          const SizedBox(height: 20),
          // Search and Filter Bar
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search users...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: 'All Roles',
                items: const [
                  DropdownMenuItem(value: 'All Roles', child: Text('All Roles')),
                  DropdownMenuItem(value: 'Dean', child: Text('Dean')),
                  DropdownMenuItem(value: 'Faculty', child: Text('Faculty')),
                  DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                ],
                onChanged: (value) {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Table Header
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Expanded(flex: 2, child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(flex: 2, child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Role', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(child: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildUserRow('Dr. John Smith', 'john.smith@university.edu', 'Dean', 'Active', Colors.green),
                          _buildUserRow('Prof. Mary Johnson', 'mary.johnson@university.edu', 'Faculty', 'Active', Colors.green),
                          _buildUserRow('Dr. Sarah Wilson', 'sarah.wilson@university.edu', 'Faculty', 'Active', Colors.green),
                          _buildUserRow('Mike Davis', 'mike.davis@university.edu', 'Admin', 'Pending', Colors.orange),
                          _buildUserRow('Dr. Robert Brown', 'robert.brown@university.edu', 'Faculty', 'Inactive', Colors.red),
                          _buildUserRow('Lisa Anderson', 'lisa.anderson@university.edu', 'Faculty', 'Active', Colors.green),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserStatCard(String title, String value, IconData icon, Color color) {
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

  Widget _buildUserRow(String name, String email, String role, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  child: Icon(Icons.person, size: 16),
                ),
                const SizedBox(width: 8),
                Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text(email)),
          Expanded(child: Text(role)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(color: statusColor, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, size: 16),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 16),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}