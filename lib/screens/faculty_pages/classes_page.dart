import 'package:flutter/material.dart';

class FacultyClassesPage extends StatelessWidget {
  const FacultyClassesPage({super.key});

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
              const Text('Classes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Class'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isNarrow = constraints.maxWidth < 700;
              if (isNarrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildClassStatCardBox('Active Classes', '6', Icons.class_, Colors.blue),
                    const SizedBox(height: 12),
                    _buildClassStatCardBox('Total Students', '180', Icons.people, Colors.green),
                    const SizedBox(height: 12),
                    _buildClassStatCardBox('This Semester', '6', Icons.calendar_today, Colors.orange),
                  ],
                );
              }
              return Row(
                children: [
                  _buildClassStatCard('Active Classes', '6', Icons.class_, Colors.blue),
                  const SizedBox(width: 20),
                  _buildClassStatCard('Total Students', '180', Icons.people, Colors.green),
                  const SizedBox(width: 20),
                  _buildClassStatCard('This Semester', '6', Icons.calendar_today, Colors.orange),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isNarrow = constraints.maxWidth < 700;
                if (isNarrow) {
                  return Column(
                    children: [
                      _buildClassListCard(),
                      const SizedBox(height: 20),
                      _buildClassDetailsCard(),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildClassListCard(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildClassDetailsCard(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassStatCardBox(String title, String value, IconData icon, Color color) {
    return Card(
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
    );
  }

  Widget _buildClassStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(child: _buildClassStatCardBox(title, value, icon, color));
  }

  Widget _buildClassListCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Current Classes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildClassItem('CS 101', 'Introduction to Programming', '45 students', 'MWF 9:00-10:30 AM', Colors.blue),
                  _buildClassItem('CS 201', 'Data Structures', '38 students', 'TTh 2:00-3:30 PM', Colors.green),
                  _buildClassItem('CS 301', 'Database Systems', '32 students', 'MWF 4:00-5:30 PM', Colors.orange),
                  _buildClassItem('CS 401', 'Software Engineering', '28 students', 'TTh 10:00-11:30 AM', Colors.purple),
                  _buildClassItem('CS 450', 'Machine Learning', '25 students', 'MWF 1:00-2:30 PM', Colors.red),
                  _buildClassItem('CS 499', 'Senior Capstone', '17 students', 'F 3:00-6:00 PM', Colors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildActionButton('Take Attendance', Icons.how_to_reg, Colors.blue),
            const SizedBox(height: 10),
            _buildActionButton('Grade Assignments', Icons.grade, Colors.green),
            const SizedBox(height: 10),
            _buildActionButton('Post Announcement', Icons.announcement, Colors.orange),
            const SizedBox(height: 10),
            _buildActionButton('View Gradebook', Icons.book, Colors.purple),
            const SizedBox(height: 30),
            const Text('Upcoming Deadlines', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildDeadlineItem('CS 101 - Assignment 3', 'Dec 15, 2023'),
            _buildDeadlineItem('CS 201 - Midterm Grades', 'Dec 18, 2023'),
            _buildDeadlineItem('CS 301 - Project Proposal', 'Dec 20, 2023'),
          ],
        ),
      ),
    );
  }

  Widget _buildClassItem(String code, String name, String students, String schedule, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Text(
            code.split(' ')[1],
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text('$code - $name', style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(students),
            Text(schedule, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'view', child: Text('View Details')),
            const PopupMenuItem(value: 'attendance', child: Text('Take Attendance')),
            const PopupMenuItem(value: 'grades', child: Text('Manage Grades')),
            const PopupMenuItem(value: 'edit', child: Text('Edit Class')),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color) {
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

  Widget _buildDeadlineItem(String task, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.schedule, size: 16, color: Colors.orange[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                Text(date, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}