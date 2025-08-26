import 'package:flutter/material.dart';
// Removed unused math import

class DeanEvaluationReportsPage extends StatelessWidget {
  const DeanEvaluationReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EvaluationReportsView(),
    );
  }
}

class DataAnalyticsView extends StatelessWidget {
  const DataAnalyticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Faculty Evaluation Analytics',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 32, 42, 68),
            ),
          ),
          const SizedBox(height: 20),
          _buildOverviewCards(),
          const SizedBox(height: 20),
          _buildRatingDistributionChart(),
          const SizedBox(height: 20),
          _buildPerformanceTrendsChart(),
          const SizedBox(height: 20),
          // _buildDepartmentComparison(),
          // const SizedBox(height: 20),
          _buildDetailedInsights(),
        ],
      ),
    );
  }

  Widget _buildOverviewCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isNarrow = constraints.maxWidth < 700;
        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildStatCard('Total Evaluations', '127', Icons.assignment_turned_in, Colors.blue),
              const SizedBox(height: 12),
              _buildStatCard('Average Rating', '4.2', Icons.star, Colors.amber),
              const SizedBox(height: 12),
              _buildStatCard('Faculty Count', '25', Icons.people, Colors.green),
              // const SizedBox(height: 12),
              // _buildStatCard('Departments', '5', Icons.business, Colors.purple),
            ],
          );
        }
        return Row(
          children: [
            Expanded(child: _buildStatCard('Total Evaluations', '21', Icons.assignment_turned_in, Colors.blue)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatCard('Average Rating', '4.2', Icons.star, Colors.amber)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatCard('Faculty Count', '25', Icons.people, Colors.green)),
            // const SizedBox(width: 16),
            // Expanded(child: _buildStatCard('Departments', '5', Icons.business, Colors.purple)),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _buildRatingDistributionChart() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rating Distribution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 8),
                    _buildBarChart('Outstanding', 35, Colors.green, 200),
                    const SizedBox(width: 16),
                    _buildBarChart('Very Satisfactory', 45, Colors.lightGreen, 200),
                    const SizedBox(width: 16),
                    _buildBarChart('Satisfactory', 30, Colors.yellow[700]!, 200),
                    const SizedBox(width: 16),
                    _buildBarChart('Fair', 12, Colors.orange, 200),
                    const SizedBox(width: 16),
                    _buildBarChart('Poor', 5, Colors.red, 200),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(String label, int value, Color color, double maxHeight) {
    final double heightFactor = (value.clamp(0, 50) / 50) * 0.8;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 70),
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: heightFactor,
                child: Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 70,
            child: Text(
              label,
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceTrendsChart() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Performance Trends (Last 6 Months)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: CustomPaint(
                painter: LineChartPainter(),
                size: const Size(double.infinity, 150),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem('Overall Average', Colors.blue),
                _buildLegendItem('Computer Science', Colors.green),
                _buildLegendItem('Information Technology', Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Widget _buildDepartmentComparison() {
  //   return Card(
  //     elevation: 2,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             'Performance Comparison',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 16),
  //           _buildDepartmentRow('Computer Science', 4.5, Colors.green),
  //           _buildDepartmentRow('Mathematics', 4.2, Colors.lightGreen),
  //           _buildDepartmentRow('Physics', 4.0, Colors.yellow[700]!),
  //           _buildDepartmentRow('Chemistry', 3.8, Colors.orange),
  //           _buildDepartmentRow('Biology', 3.9, Colors.orange),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDepartmentRow(String subjectTaught, double rating, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(subjectTaught, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: rating / 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedInsights() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Key Insights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInsightItem(
              Icons.trending_up,
              'Performance Improvement',
              'Overall faculty performance has increased by 8% this semester',
              Colors.green,
            ),
            _buildInsightItem(
              Icons.star,
              'Top Performers',
              '15 faculty members achieved "Outstanding" ratings this month',
              Colors.amber,
            ),
            _buildInsightItem(
              Icons.warning,
              'Areas for Improvement',
              '3 faculty members need additional support in teaching methodology',
              Colors.orange,
            ),
            _buildInsightItem(
              Icons.school,
              'Student Satisfaction',
              '92% of students rated their instructors as "Satisfactory" or above',
              Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightItem(IconData icon, String title, String description, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Sample data points for different lines
    final overallData = [3.8, 4.0, 4.1, 4.2, 4.3, 4.2];
    final csData = [4.0, 4.2, 4.3, 4.5, 4.6, 4.5];
    final mathData = [3.6, 3.8, 3.9, 4.0, 4.1, 4.2];

    _drawLine(canvas, size, overallData, Colors.blue, paint);
    _drawLine(canvas, size, csData, Colors.green, paint);
    _drawLine(canvas, size, mathData, Colors.orange, paint);
  }

  void _drawLine(Canvas canvas, Size size, List<double> data, Color color, Paint paint) {
    paint.color = color;
    final path = Path();
    
    for (int i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y = size.height - ((data[i] - 3.0) / 2.0) * size.height; // Scale from 3.0 to 5.0
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Keep the existing EvaluationReportsView and EvaluationFormView classes unchanged
class EvaluationReportsView extends StatelessWidget {
  const EvaluationReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Faculty Evaluation Reports',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 32, 42, 68),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 32, 42, 68),
                      child: Text(
                        'F${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('Faculty Member ${index + 1}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Subject Taught: Computer Science'),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 50,
                              child: Text(
                                'Rating:',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < (4 - index % 2) ? Icons.star : Icons.star_border,
                                  color: Colors.amber[600],
                                  size: 18,
                                );
                              }),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${(4.5 - (index * 0.2)).toStringAsFixed(1)}',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showDetailedReport(context, index + 1);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailedReport(BuildContext context, int facultyNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Faculty Member $facultyNumber - Detailed Report'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Evaluation Summary:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildReportItem('Mastery of Subject Matter', 4.2),
                _buildReportItem('Teaching Methodology', 4.0),
                _buildReportItem('Classroom Management', 4.5),
                _buildReportItem('Student Engagement', 3.8),
                const SizedBox(height: 15),
                const Text('Overall Rating:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    const SizedBox(
                      width: 50,
                      child: Text('Stars:'),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber[600],
                          size: 20,
                        );
                      }),
                    ),
                    const Text('4.1 - Very Satisfactory'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReportItem(String category, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              category,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating.round() ? Icons.star : Icons.star_border,
                      color: Colors.amber[600],
                      size: 16,
                    );
                  }),
                ),
                const SizedBox(width: 8),
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EvaluationFormView extends StatefulWidget {
  const EvaluationFormView({Key? key}) : super(key: key);

  @override
  State<EvaluationFormView> createState() => _EvaluationFormViewState();
}

class _EvaluationFormViewState extends State<EvaluationFormView> {
  Map<String, int> ratings = {};
  FacultyMember? selectedFacultyMember;
  final List<FacultyMember> availableFacultyMembers = const [
    FacultyMember(name: 'Dr. Jane Doe', subjectTaught: 'Computer Science', email: 'jane.doe@university.edu'),
    FacultyMember(name: 'Prof. Mike Johnson', subjectTaught: 'Mathematics', email: 'mike.johnson@university.edu'),
    FacultyMember(name: 'Dr. Sarah Wilson', subjectTaught: 'Physics', email: 'sarah.wilson@university.edu'),
  ];
  
  final List<EvaluationCriterion> masteryOfSubjectCriteria = [
    EvaluationCriterion(
      id: 'logical_presentation',
      text: '1. Presents lesson logically',
    ),
    EvaluationCriterion(
      id: 'relates_to_issues',
      text: '2. Relates lesson to local/national issues',
    ),
    EvaluationCriterion(
      id: 'beyond_content',
      text: '3. Provides explanation beyond the content of the book',
    ),
    EvaluationCriterion(
      id: 'independent_teaching',
      text: '4. Teaches independent of notes',
    ),
  ];

  final List<EvaluationCriterion> instructionalSkillsCriteria = [
    EvaluationCriterion(
      id: 'motivation_techniques',
      text: '1. Uses motivation techniques that elicit student\'s interest',
    ),
    EvaluationCriterion(
      id: 'links_past_present',
      text: '2. Links the past with the present lesson',
    ),
    EvaluationCriterion(
      id: 'varied_strategies',
      text: '3. Use varied strategies suited to the student\'s needs',
    ),
    EvaluationCriterion(
      id: 'varied_questions',
      text: '4. Asks varied types of questions',
    ),
    EvaluationCriterion(
      id: 'anticipates_difficulties',
      text: '5. Anticipates difficulties of students',
    ),
    EvaluationCriterion(
      id: 'provides_reinforcement',
      text: '6. Provides appropriate reinforcement to student\'s responses',
    ),
    EvaluationCriterion(
      id: 'multiple_sources',
      text: '7. Utilizes multiple source of information',
    ),
    EvaluationCriterion(
      id: 'encourages_speaking',
      text: '8. Encourages students to speak and write',
    ),
    EvaluationCriterion(
      id: 'integrates_values',
      text: '9. Integrates values in the lesson',
    ),
    EvaluationCriterion(
      id: 'free_expression',
      text: '10. Provides opportunities for free expression of ideas',
    ),
  ];

  final List<EvaluationCriterion> communicationSkillsCriteria = [
    EvaluationCriterion(
      id: 'well_modulated_voice',
      text: '1. Speaks in a well-modulated voice',
    ),
    EvaluationCriterion(
      id: 'appropriate_language',
      text: '2. Uses language appropriate to the level of the class',
    ),
    EvaluationCriterion(
      id: 'correct_pronunciation',
      text: '3. Pronounces words correctly',
    ),
    EvaluationCriterion(
      id: 'correct_grammar',
      text: '4. Observes correct grammar in both speaking and writing',
    ),
    EvaluationCriterion(
      id: 'encourages_communication',
      text: '5. Encourages students to speak and write',
    ),
    EvaluationCriterion(
      id: 'listens_attentively',
      text: '6. Listens attentively to student\'s response',
    ),
  ];

  final List<EvaluationCriterion> evaluationTechniquesCriteria = [
    EvaluationCriterion(
      id: 'evaluates_achievement',
      text: '1. Evaluates student\'s achievement based in the day\'s lesson',
    ),
    EvaluationCriterion(
      id: 'appropriate_assessment',
      text: '2. Utilizes appropriate assessment tools and techniques',
    ),
  ];

  final List<EvaluationCriterion> classroomManagementCriteria = [
    EvaluationCriterion(
      id: 'maintains_discipline',
      text: '1. Maintains discipline (e.g. Keeps student\'s task)',
    ),
    EvaluationCriterion(
      id: 'manages_time',
      text: '2. Manages time profitably through curriculum-related activities',
    ),
    EvaluationCriterion(
      id: 'maximizes_resources',
      text: '3. Maximizes use of resources',
    ),
    EvaluationCriterion(
      id: 'good_rapport',
      text: '4. Maintains good rapport with the students',
    ),
    EvaluationCriterion(
      id: 'respects_limitations',
      text: '5. Shows respect for individual student\'s limitation',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFacultySelectionCard(),
          const SizedBox(height: 20),
          _buildInstructionsCard(),
          const SizedBox(height: 20),
          _buildRatingScaleCard(),
          const SizedBox(height: 20),
          _buildEvaluationSectionCard('A. Mastery of Subject - Matter (25%)', masteryOfSubjectCriteria),
          const SizedBox(height: 20),
          _buildEvaluationSectionCard('B. Instructional Skills (25%)', instructionalSkillsCriteria),
          const SizedBox(height: 20),
          _buildEvaluationSectionCard('C. Communication Skills (20%)', communicationSkillsCriteria),
          const SizedBox(height: 20),
          _buildEvaluationSectionCard('D. Evaluation Techniques (15%)', evaluationTechniquesCriteria),
          const SizedBox(height: 20),
          _buildEvaluationSectionCard('E. Classroom Management Skills (15%)', classroomManagementCriteria),
          const SizedBox(height: 30),
          _buildOverallScoreCard(),
          const SizedBox(height: 20),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildFacultySelectionCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.person_search, color: Color.fromARGB(255, 32, 42, 68)),
                SizedBox(width: 8),
                Text(
                  'Select Faculty to Evaluate',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<FacultyMember>(
              value: selectedFacultyMember,
              decoration: const InputDecoration(
                labelText: 'Faculty Member',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              items: availableFacultyMembers.map((member) {
                return DropdownMenuItem<FacultyMember>(
                  value: member,
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 14, child: Icon(Icons.person, size: 16)),
                      const SizedBox(width: 10),
                      Text(member.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (member) {
                setState(() {
                  selectedFacultyMember = member;
                });
              },
            ),
            if (selectedFacultyMember != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue[600]),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Evaluating: ${selectedFacultyMember!.name} • ${selectedFacultyMember!.subjectTaught}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionsCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue[600]),
                const SizedBox(width: 8),
                const Text(
                  'Instructions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'This instrument is used to evaluate the teaching effectiveness of the faculty. Check the column under the number that corresponds to your rating for the faculty concerned using the scale coded as follows:',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingScaleCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star_outline, color: Colors.amber[600]),
                const SizedBox(width: 8),
                const Text(
                  'Rating Scale',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildRatingScaleItem(5, 'Outstanding', '4.51 - 5.0', Colors.green),
            _buildRatingScaleItem(4, 'Very Satisfactory', '3.51 - 4.50', Colors.lightGreen),
            _buildRatingScaleItem(3, 'Satisfactory', '2.51 - 3.50', Colors.yellow[700]!),
            _buildRatingScaleItem(2, 'Fair', '1.51 - 2.50', Colors.orange),
            _buildRatingScaleItem(1, 'Poor', '1.0 - 1.50', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingScaleItem(int stars, String label, String range, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '$stars -',
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < stars ? Icons.star : Icons.star_border,
                color: Colors.amber[600],
                size: 16,
              );
            }),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$label ($range)',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationSectionCard(String sectionTitle, List<EvaluationCriterion> criteria) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 42, 68),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                sectionTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ...criteria.map((criterion) => 
              _buildCriterionRow(criterion)
            ).toList(),
            const SizedBox(height: 20),
            _buildTotalScoreRow(criteria.length),
          ],
        ),
      ),
    );
  }

  Widget _buildCriterionRow(EvaluationCriterion criterion) {
    int currentRating = ratings[criterion.id] ?? 0;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            criterion.text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 60),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    int starValue = index + 1;
                    bool isFilled = starValue <= currentRating;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          ratings[criterion.id] = starValue;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          isFilled ? Icons.star : Icons.star_border,
                          color: isFilled ? Colors.amber[600] : Colors.grey[400],
                          size: 32,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          if (currentRating > 0) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 60,
                  child: Text(
                    'Level:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getRatingColor(currentRating).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _getRatingLabel(currentRating),
                        style: TextStyle(
                          color: _getRatingColor(currentRating),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTotalScoreRow(int criteriaCount) {
    double totalScore = _calculateTotalScore(criteriaCount);
    double averageScore = totalScore / criteriaCount;
    int roundedAverage = averageScore.round();
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Score / Mean / Wtd. Mean',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                totalScore > 0 ? '${totalScore.toStringAsFixed(1)} / ${averageScore.toStringAsFixed(2)}' : 'Not rated',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (totalScore > 0) ...[
            const SizedBox(height: 12),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                const Text(
                  'Overall Rating:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    int starValue = index + 1;
                    bool isFilled = starValue <= roundedAverage;
                    return Icon(
                      isFilled ? Icons.star : Icons.star_border,
                      color: Colors.amber[600],
                      size: 20,
                    );
                  }),
                ),
                Text(
                  _getRatingLabel(roundedAverage),
                  style: TextStyle(
                    color: _getRatingColor(roundedAverage),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOverallScoreCard() {
    double totalScore = _calculateTotalScore(masteryOfSubjectCriteria.length +
                                            instructionalSkillsCriteria.length +
                                            communicationSkillsCriteria.length +
                                            evaluationTechniquesCriteria.length +
                                            classroomManagementCriteria.length);
    double averageScore = totalScore / (masteryOfSubjectCriteria.length +
                                        instructionalSkillsCriteria.length +
                                        communicationSkillsCriteria.length +
                                        evaluationTechniquesCriteria.length +
                                        classroomManagementCriteria.length);
    int roundedAverage = averageScore.round();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overall Evaluation Score',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem('Overall Average', Colors.blue),
                _buildLegendItem('Overall Rating', Colors.amber),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOverallScoreItem('Total Score', totalScore.toStringAsFixed(1), Colors.blue),
                _buildOverallScoreItem('Average Score', averageScore.toStringAsFixed(2), Colors.amber),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 8,
              children: [
                const Text(
                  'Overall Rating:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    int starValue = index + 1;
                    bool isFilled = starValue <= roundedAverage;
                    return Icon(
                      isFilled ? Icons.star : Icons.star_border,
                      color: Colors.amber[600],
                      size: 20,
                    );
                  }),
                ),
                Text(
                  _getRatingLabel(roundedAverage),
                  style: TextStyle(
                    color: _getRatingColor(roundedAverage),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverallScoreItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSubmitButton() {
    bool allRated = masteryOfSubjectCriteria.every((criterion) => 
      ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
    ) &&
    instructionalSkillsCriteria.every((criterion) => 
      ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
    ) &&
    communicationSkillsCriteria.every((criterion) => 
      ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
    ) &&
    evaluationTechniquesCriteria.every((criterion) => 
      ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
    ) &&
    classroomManagementCriteria.every((criterion) => 
      ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
    );
    bool hasSelectedFaculty = selectedFacultyMember != null;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: allRated && hasSelectedFaculty ? _submitEvaluation : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 32, 42, 68),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          hasSelectedFaculty
              ? (allRated ? 'Submit Evaluation' : 'Please rate all criteria')
              : 'Select faculty to evaluate',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  double _calculateTotalScore(int criteriaCount) {
    double total = 0;
    for (var criterion in masteryOfSubjectCriteria) {
      if (ratings.containsKey(criterion.id) && ratings[criterion.id] != null) {
        total += ratings[criterion.id]!.toDouble();
      }
    }
    for (var criterion in instructionalSkillsCriteria) {
      if (ratings.containsKey(criterion.id) && ratings[criterion.id] != null) {
        total += ratings[criterion.id]!.toDouble();
      }
    }
    for (var criterion in communicationSkillsCriteria) {
      if (ratings.containsKey(criterion.id) && ratings[criterion.id] != null) {
        total += ratings[criterion.id]!.toDouble();
      }
    }
    for (var criterion in evaluationTechniquesCriteria) {
      if (ratings.containsKey(criterion.id) && ratings[criterion.id] != null) {
        total += ratings[criterion.id]!.toDouble();
      }
    }
    for (var criterion in classroomManagementCriteria) {
      if (ratings.containsKey(criterion.id) && ratings[criterion.id] != null) {
        total += ratings[criterion.id]!.toDouble();
      }
    }
    return total;
  }

  String _getRatingLabel(int rating) {
    switch (rating) {
      case 5: return 'Outstanding';
      case 4: return 'Very Satisfactory';
      case 3: return 'Satisfactory';
      case 2: return 'Fair';
      case 1: return 'Poor';
      default: return 'Not rated';
    }
  }

  Color _getRatingColor(int rating) {
    switch (rating) {
      case 5: return Colors.green;
      case 4: return Colors.lightGreen;
      case 3: return Colors.yellow[700]!;
      case 2: return Colors.orange;
      case 1: return Colors.red;
      default: return Colors.grey;
    }
  }

  void _submitEvaluation() {
    double totalScore = _calculateTotalScore(masteryOfSubjectCriteria.length +
                                            instructionalSkillsCriteria.length +
                                            communicationSkillsCriteria.length +
                                            evaluationTechniquesCriteria.length +
                                            classroomManagementCriteria.length);
    double averageScore = totalScore / (masteryOfSubjectCriteria.length +
                                        instructionalSkillsCriteria.length +
                                        communicationSkillsCriteria.length +
                                        evaluationTechniquesCriteria.length +
                                        classroomManagementCriteria.length);
    int roundedAverage = averageScore.round();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Evaluation Submitted Successfully!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedFacultyMember != null) ...[
                Text('Faculty: ${selectedFacultyMember!.name}'),
                Text('subjectTaught: ${selectedFacultyMember!.subjectTaught}'),
                Text('Email: ${selectedFacultyMember!.email}'),
                const SizedBox(height: 8),
              ],
              Text('Total Score: ${totalScore.toStringAsFixed(1)}'),
              Text('Average Score: ${averageScore.toStringAsFixed(2)}'),
              Text('Overall Rating: ${_getRatingLabel(roundedAverage)}'),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                    child: Text('Stars:'),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      int starValue = index + 1;
                      bool isFilled = starValue <= roundedAverage;
                      return Icon(
                        isFilled ? Icons.star : Icons.star_border,
                        color: Colors.amber[600],
                        size: 20,
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.analytics, color: Colors.blue[600]),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'View detailed analytics in the Analytics tab!',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  ratings.clear();
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class EvaluationCriterion {
  final String id;
  final String text;

  EvaluationCriterion({
    required this.id,
    required this.text,
  });
}

class FacultyMember {
  final String name;
  final String subjectTaught;
  final String email;

  const FacultyMember({
    required this.name,
    required this.subjectTaught,
    required this.email,
  });
}