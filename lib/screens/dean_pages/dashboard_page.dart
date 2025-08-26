// import 'package:flutter/material.dart';

// class DeanDashboardPage extends StatelessWidget {
//   const DeanDashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Welcome back, Dean!',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               final bool isNarrow = constraints.maxWidth < 700;
//               if (isNarrow) {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     _buildStatCardBox('Total Faculty', '156', Icons.people, Colors.blue),
//                     const SizedBox(height: 12),
//                     _buildStatCardBox('Evaluations', '89%', Icons.assessment, Colors.orange),
//                   ],
//                 );
//               }
//               return Row(
//                 children: [
//                   _buildStatCard('Total Faculty', '156', Icons.people, Colors.blue),
//                   const SizedBox(width: 20),
//                   _buildStatCard('Evaluations', '89%', Icons.assessment, Colors.orange),
//                 ],
//               );
//             },
//           ),
//           const SizedBox(height: 30),
//           Expanded(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 final bool isNarrow = constraints.maxWidth < 700;
//                 if (isNarrow) {
//                   return Column(
//                     children: [
//                       _buildRecentActivityCard(),
//                       const SizedBox(height: 20),
//                       _buildUpcomingTasksCard(),
//                     ],
//                   );
//                 },

//                 return Row(
//                   children: [
//                     Expanded(
//                       child: _buildRecentActivityCard(),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: _buildUpcomingTasksCard(),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
          
//         ],
//       ),
//     );
//   }

//   Widget _buildStatCardBox(String title, String value, IconData icon, Color color) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             Icon(icon, size: 40, color: color),
//             const SizedBox(width: 15),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                 Text(title, style: TextStyle(color: Colors.grey[600])),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Expanded(child: _buildStatCardBox(title, value, icon, color));
//   }

//   Widget _buildRecentActivityCard() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 15),
//             _buildActivityItem('New faculty evaluation completed', '2 hours ago'),
//             _buildActivityItem('Department meeting scheduled', '4 hours ago'),
//             _buildActivityItem('Budget report submitted', '1 day ago'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildUpcomingTasksCard() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Upcoming Tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 15),
//             _buildTaskItem('Review faculty applications', 'Tomorrow'),
//             _buildTaskItem('Budget meeting', 'Dec 15'),
//             _buildTaskItem('Semester planning', 'Dec 20'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActivityItem(String activity, String time) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           const Icon(Icons.circle, size: 8, color: Colors.blue),
//           const SizedBox(width: 10),
//           Expanded(child: Text(activity)),
//           Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//         ],
//       ),
//     );
//   }

//   Widget _buildTaskItem(String task, String date) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           const Icon(Icons.task_alt, size: 16, color: Colors.orange),
//           const SizedBox(width: 10),
//           Expanded(child: Text(task)),
//           Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DeanDashboardPage extends StatelessWidget {
  const DeanDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome back, Dean!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
