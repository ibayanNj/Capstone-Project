import 'package:flutter/material.dart';

class FacultyFeedbackPage extends StatelessWidget {
  const FacultyFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Student Feedback', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: 'All Courses',
                      items: const [
                        DropdownMenuItem(value: 'All Courses', child: Text('All Courses')),
                        DropdownMenuItem(value: 'CS 101', child: Text('CS 101')),
                        DropdownMenuItem(value: 'CS 201', child: Text('CS 201')),
                        DropdownMenuItem(value: 'CS 301', child: Text('CS 301')),
                      ],
                      onChanged: (value) {},
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh'),
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
                      _buildFeedbackStatCardBox('Average Rating', '4.6/5', Icons.star, Colors.amber),
                      const SizedBox(height: 12),
                      _buildFeedbackStatCardBox('Total Reviews', '247', Icons.rate_review, Colors.blue),
                      const SizedBox(height: 12),
                      _buildFeedbackStatCardBox('Response Rate', '89%', Icons.trending_up, Colors.green),
                    ],
                  );
                }
                return Row(
                  children: [
                    _buildFeedbackStatCard('Average Rating', '4.6/5', Icons.star, Colors.amber),
                    const SizedBox(width: 20),
                    _buildFeedbackStatCard('Total Reviews', '247', Icons.rate_review, Colors.blue),
                    const SizedBox(width: 20),
                    _buildFeedbackStatCard('Response Rate', '89%', Icons.trending_up, Colors.green),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isNarrow = constraints.maxWidth < 700;
                if (isNarrow) {
                  return Column(
                    children: [
                      _buildRecentFeedbackCard(),
                      const SizedBox(height: 20),
                      _buildFeedbackAnalyticsCard(),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildRecentFeedbackCard(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildFeedbackAnalyticsCard(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackStatCardBox(String title, String value, IconData icon, Color color) {
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

  Widget _buildFeedbackStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(child: _buildFeedbackStatCardBox(title, value, icon, color));
  }

  Widget _buildRecentFeedbackCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Recent Feedback', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: 400, // Fixed height to prevent overflow
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildFeedbackItem(
                    'CS 101 - Introduction to Programming',
                    'Excellent explanation of complex concepts. Very patient with questions.',
                    '⭐⭐⭐⭐⭐',
                    '2 days ago',
                    Colors.green,
                  ),
                  _buildFeedbackItem(
                    'CS 201 - Data Structures',
                    'Great use of visual aids and examples. Assignments are challenging but fair.',
                    '⭐⭐⭐⭐⭐',
                    '3 days ago',
                    Colors.green,
                  ),
                  _buildFeedbackItem(
                    'CS 301 - Database Systems',
                    'Could use more practical examples. Theory is well explained though.',
                    '⭐⭐⭐⭐',
                    '5 days ago',
                    Colors.blue,
                  ),
                  _buildFeedbackItem(
                    'CS 450 - Machine Learning',
                    'Very knowledgeable instructor. Office hours are extremely helpful.',
                    '⭐⭐⭐⭐⭐',
                    '1 week ago',
                    Colors.green,
                  ),
                  _buildFeedbackItem(
                    'CS 101 - Introduction to Programming',
                    'Sometimes goes too fast through examples. Otherwise great class.',
                    '⭐⭐⭐⭐',
                    '1 week ago',
                    Colors.blue,
                  ),
                  _buildFeedbackItem(
                    'CS 201 - Data Structures',
                    'Fantastic teacher! Makes difficult topics easy to understand.',
                    '⭐⭐⭐⭐⭐',
                    '2 weeks ago',
                    Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackAnalyticsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Feedback Analytics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildRatingBreakdown('5 Stars', 156, 247, Colors.green),
            const SizedBox(height: 10),
            _buildRatingBreakdown('4 Stars', 67, 247, Colors.lightGreen),
            const SizedBox(height: 10),
            _buildRatingBreakdown('3 Stars', 18, 247, Colors.yellow),
            const SizedBox(height: 10),
            _buildRatingBreakdown('2 Stars', 4, 247, Colors.orange),
            const SizedBox(height: 10),
            _buildRatingBreakdown('1 Star', 2, 247, Colors.red),
            const SizedBox(height: 30),
            const Text('Common Keywords', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildKeywordChip('Helpful', Colors.green),
                _buildKeywordChip('Clear', Colors.blue),
                _buildKeywordChip('Patient', Colors.purple),
                _buildKeywordChip('Knowledgeable', Colors.orange),
                _buildKeywordChip('Organized', Colors.teal),
                _buildKeywordChip('Engaging', Colors.pink),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Improvement Areas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildImprovementItem('Pace of lectures', 12),
            _buildImprovementItem('More examples', 8),
            _buildImprovementItem('Assignment clarity', 5),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackItem(String course, String comment, String rating, String time, Color ratingColor) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    course,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                Text(time, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
            const SizedBox(height: 8),
            Text(comment, style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(rating, style: const TextStyle(fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: ratingColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    rating.split('⭐').length > 4 ? 'Excellent' : 'Good',
                    style: TextStyle(color: ratingColor, fontSize: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBreakdown(String stars, int count, int total, Color color) {
    double percentage = count / total;
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Text(stars, style: const TextStyle(fontSize: 12)),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          child: Text('$count', style: const TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildKeywordChip(String keyword, Color color) {
    return Chip(
      label: Text(keyword, style: const TextStyle(fontSize: 11)),
      backgroundColor: color.withOpacity(0.1),
      labelStyle: TextStyle(color: color),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _buildImprovementItem(String area, int mentions) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(area, style: const TextStyle(fontSize: 12)),
          Text('$mentions mentions', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
        ],
      ),
    );
  }
}