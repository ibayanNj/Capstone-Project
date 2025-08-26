import 'package:flutter/material.dart';

class FacultyEvaluationsPage extends StatelessWidget {
  const FacultyEvaluationsPage({super.key});

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
              const Text('My Evaluations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
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
                    _buildEvaluationStatCardBox('Completed', '12', Colors.green),
                    const SizedBox(height: 12),
                    _buildEvaluationStatCardBox('Pending', '3', Colors.orange),
                    const SizedBox(height: 12),
                    _buildEvaluationStatCardBox('Average Score', '4.6/5', Colors.blue),
                  ],
                );
              }
              return Row(
                children: [
                  _buildEvaluationStatCard('Completed', '12', Colors.green),
                  const SizedBox(width: 20),
                  _buildEvaluationStatCard('Pending', '3', Colors.orange),
                  const SizedBox(width: 20),
                  _buildEvaluationStatCard('Average Score', '4.6/5', Colors.blue),
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
                      _buildEvaluationHistoryCard(),
                      const SizedBox(height: 20),
                      _buildEvaluationSummaryCard(),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildEvaluationHistoryCard(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildEvaluationSummaryCard(),
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

  Widget _buildEvaluationStatCardBox(String title, String value, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvaluationStatCard(String title, String value, Color color) {
    return Expanded(child: _buildEvaluationStatCardBox(title, value, color));
  }

  Widget _buildEvaluationHistoryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recent Evaluations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildEvaluationItem('Fall 2023 - CS 101', 'Student Evaluation', '4.8/5', 'Completed', Colors.green),
                  _buildEvaluationItem('Fall 2023 - CS 201', 'Peer Review', '4.5/5', 'Completed', Colors.green),
                  _buildEvaluationItem('Fall 2023 - CS 301', 'Student Evaluation', 'Pending', 'In Progress', Colors.orange),
                  _buildEvaluationItem('Spring 2023 - CS 101', 'Dean Review', '4.7/5', 'Completed', Colors.green),
                  _buildEvaluationItem('Spring 2023 - CS 201', 'Student Evaluation', '4.6/5', 'Completed', Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvaluationSummaryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Evaluation Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildSummaryItem('Teaching Effectiveness', '4.7/5', 0.94),
            const SizedBox(height: 15),
            _buildSummaryItem('Course Organization', '4.5/5', 0.90),
            const SizedBox(height: 15),
            _buildSummaryItem('Student Engagement', '4.8/5', 0.96),
            const SizedBox(height: 15),
            _buildSummaryItem('Communication', '4.6/5', 0.92),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Overall Rating', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('4.6/5', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700])),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvaluationItem(String course, String type, String score, String status, Color statusColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.1),
          child: Icon(
            status == 'Completed' ? Icons.check_circle : Icons.pending,
            color: statusColor,
          ),
        ),
        title: Text(course, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(type),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(score, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(status, style: TextStyle(color: statusColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String category, String score, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category, style: const TextStyle(fontSize: 14)),
            Text(score, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[600]!),
        ),
      ],
    );
  }
}