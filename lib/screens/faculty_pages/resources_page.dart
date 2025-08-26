import 'package:flutter/material.dart';

class FacultyResourcesPage extends StatelessWidget {
  const FacultyResourcesPage({super.key});

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
              const Text('Resources', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.create_new_folder),
                    label: const Text('New Folder'),
                  ),
                ],
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
                    _buildResourceStatCardBox('Total Files', '156', Icons.description, Colors.blue),
                    const SizedBox(height: 12),
                    _buildResourceStatCardBox('Storage Used', '2.4 GB', Icons.storage, Colors.green),
                    const SizedBox(height: 12),
                    _buildResourceStatCardBox('Shared Files', '23', Icons.share, Colors.orange),
                  ],
                );
              }
              return Row(
                children: [
                  _buildResourceStatCard('Total Files', '156', Icons.description, Colors.blue),
                  const SizedBox(width: 20),
                  _buildResourceStatCard('Storage Used', '2.4 GB', Icons.storage, Colors.green),
                  const SizedBox(width: 20),
                  _buildResourceStatCard('Shared Files', '23', Icons.share, Colors.orange),
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
                      _buildFileExplorerCard(),
                      const SizedBox(height: 20),
                      _buildQuickAccessCard(),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildFileExplorerCard(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildQuickAccessCard(),
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

  Widget _buildResourceStatCardBox(String title, String value, IconData icon, Color color) {
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

  Widget _buildResourceStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(child: _buildResourceStatCardBox(title, value, icon, color));
  }

  Widget _buildFileExplorerCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('My Files', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.view_list),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.grid_view),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Breadcrumb
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Home'),
                ),
                const Icon(Icons.chevron_right, size: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text('Course Materials'),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildFolderItem('CS 101 - Introduction to Programming', '45 files', Icons.folder, Colors.blue),
                  _buildFolderItem('CS 201 - Data Structures', '38 files', Icons.folder, Colors.green),
                  _buildFolderItem('CS 301 - Database Systems', '32 files', Icons.folder, Colors.orange),
                  _buildFolderItem('CS 401 - Software Engineering', '28 files', Icons.folder, Colors.purple),
                  _buildFolderItem('CS 450 - Machine Learning', '25 files', Icons.folder, Colors.red),
                  _buildFolderItem('Research Papers', '17 files', Icons.folder, Colors.teal),
                  const Divider(),
                  _buildFileItem('Syllabus_Template.docx', '45 KB', Icons.description, Colors.blue, '2 days ago'),
                  _buildFileItem('Grading_Rubric.pdf', '128 KB', Icons.picture_as_pdf, Colors.red, '1 week ago'),
                  _buildFileItem('Lecture_Notes.pptx', '2.3 MB', Icons.slideshow, Colors.orange, '3 days ago'),
                  _buildFileItem('Assignment_Guidelines.pdf', '256 KB', Icons.picture_as_pdf, Colors.red, '5 days ago'),
                  _buildFileItem('Student_Roster.xlsx', '89 KB', Icons.table_chart, Colors.green, '1 week ago'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quick Access', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildQuickAccessButton('Course Templates', Icons.description_outlined, Colors.blue),
            const SizedBox(height: 10),
            _buildQuickAccessButton('Grading Tools', Icons.grade, Colors.green),
            const SizedBox(height: 10),
            _buildQuickAccessButton('Presentation Templates', Icons.slideshow, Colors.orange),
            const SizedBox(height: 10),
            _buildQuickAccessButton('Assessment Bank', Icons.quiz, Colors.purple),
            const SizedBox(height: 30),
            const Text('Recent Files', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildRecentFileItem('Midterm_Exam_CS101.pdf', '2 hours ago'),
            _buildRecentFileItem('Lecture10_DataStructures.pptx', '1 day ago'),
            _buildRecentFileItem('Assignment3_Solutions.docx', '2 days ago'),
            _buildRecentFileItem('Student_Feedback_Analysis.xlsx', '3 days ago'),
            const SizedBox(height: 30),
            const Text('Shared with Me', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildSharedFileItem('Department_Guidelines.pdf', 'Dr. Smith'),
            _buildSharedFileItem('Faculty_Handbook_2024.pdf', 'Admin'),
            _buildSharedFileItem('Research_Collaboration.docx', 'Dr. Johnson'),
          ],
        ),
      ),
    );
  }

  Widget _buildFolderItem(String name, String fileCount, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 32),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(fileCount),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(value: 'open', child: Text('Open')),
          const PopupMenuItem(value: 'share', child: Text('Share')),
          const PopupMenuItem(value: 'rename', child: Text('Rename')),
          const PopupMenuItem(value: 'delete', child: Text('Delete')),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildFileItem(String name, String size, IconData icon, Color color, String modified) {
    return ListTile(
      leading: Icon(icon, color: color, size: 28),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text('$size • Modified $modified'),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(value: 'download', child: Text('Download')),
          const PopupMenuItem(value: 'share', child: Text('Share')),
          const PopupMenuItem(value: 'rename', child: Text('Rename')),
          const PopupMenuItem(value: 'delete', child: Text('Delete')),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildQuickAccessButton(String title, IconData icon, Color color) {
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
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget _buildRecentFileItem(String fileName, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.history, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                Text(time, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSharedFileItem(String fileName, String sharedBy) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.people, size: 16, color: Colors.blue[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                Text('Shared by $sharedBy', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}