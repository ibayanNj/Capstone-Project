// import 'package:flutter/material.dart';

// class EvaluationForm extends StatefulWidget {
//   const EvaluationForm({super.key});

//   @override
//   State<EvaluationForm> createState() => _EvaluationFormState();
// }

// class _EvaluationFormState extends State<EvaluationForm> {
//   // Store ratings for each criterion
//   Map<String, int> ratings = {};
  
//   // Evaluation criteria for Mastery of Subject Matter
//   final List<EvaluationCriterion> masteryOfSubjectCriteria = [
//     EvaluationCriterion(
//       id: 'logical_presentation',
//       text: '1. Presents lesson logically',
//     ),
//     EvaluationCriterion(
//       id: 'relates_to_issues',
//       text: '2. Relates lesson to local/national issues',
//     ),
//     EvaluationCriterion(
//       id: 'beyond_content',
//       text: '3. Provides explanation beyond the content of the book',
//     ),
//     EvaluationCriterion(
//       id: 'independent_teaching',
//       text: '4. Teaches independent of notes',
//     ),
//   ];

//   final List<EvaluationCriterion> instructionalSkillsCriteria = [
//     EvaluationCriterion(
//       id: 'motivation',
//       text: '1. Uses motivation techniques that elicit student\'s interest',
//     ),
//     EvaluationCriterion(
//       id: 'links_past',
//       text: '2. Links the past with the present lesson',
//     ),
//     EvaluationCriterion(
//       id: 'varied_strategies',
//       text: '3. Uses varied strategies suited to the students\' needs',
//     ),
//     EvaluationCriterion(
//       id: 'varied_types',
//       text: '4. Asks varied types of questions',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         title: const Text('Faculty Evaluation Form'),
//         backgroundColor: const Color.fromARGB(255, 32, 42, 68),
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildInstructionsCard(),
//             const SizedBox(height: 20),
//             _buildRatingScaleCard(),
//             const SizedBox(height: 20),
//             _buildEvaluationSectionCard(),
//             const SizedBox(height: 30),
//             _buildSubmitButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInstructionsCard() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.info_outline, color: Colors.blue[600]),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Instructions',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             const Text(
//               'This instrument is used to evaluate the teaching effectiveness of the faculty. Check the column under the number that corresponds to your rating for the faculty concerned using the scale coded as follows:',
//               style: TextStyle(fontSize: 14, height: 1.5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRatingScaleCard() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.star_outline, color: Colors.amber[600]),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Rating Scale',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             _buildRatingScaleItem(5, 'Outstanding', '4.51 - 5.0', Colors.green),
//             _buildRatingScaleItem(4, 'Very Satisfactory', '3.51 - 4.50', Colors.lightGreen),
//             _buildRatingScaleItem(3, 'Satisfactory', '2.51 - 3.50', Colors.yellow[700]!),
//             _buildRatingScaleItem(2, 'Fair', '1.51 - 2.50', Colors.orange),
//             _buildRatingScaleItem(1, 'Poor', '1.0 - 1.50', Colors.red),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRatingScaleItem(int stars, String label, String range, Color color) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 30,
//             child: Text(
//               '$stars -',
//               style: TextStyle(fontWeight: FontWeight.bold, color: color),
//             ),
//           ),
//           Row(
//             children: List.generate(5, (index) {
//               return Icon(
//                 index < stars ? Icons.star : Icons.star_border,
//                 color: Colors.amber[600],
//                 size: 16,
//               );
//             }),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               '$label ($range)',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: color,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEvaluationSectionCard() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12.0),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 32, 42, 68),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: const Text(
//                 'A. Mastery of Subject - Matter (25%)',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 16),
//             ...masteryOfSubjectCriteria.map((criterion) => 
//               _buildCriterionRow(criterion)
//             ),
//             const SizedBox(height: 20),
//             _buildTotalScoreRow(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCriterionRow(EvaluationCriterion criterion) {
//     int currentRating = ratings[criterion.id] ?? 0;
    
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             criterion.text,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text('Rating: ', style: TextStyle(fontWeight: FontWeight.w500)),
//               const SizedBox(width: 10),
//               ...List.generate(5, (index) {
//                 int starValue = index + 1;
//                 // Star is filled if its value is <= current rating
//                 bool isFilled = starValue <= currentRating;
                
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       ratings[criterion.id] = starValue;
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 4),
//                     child: Icon(
//                       isFilled ? Icons.star : Icons.star_border,
//                       color: isFilled ? Colors.amber[600] : Colors.grey[400],
//                       size: 32,
//                     ),
//                   ),
//                 );
//               }),
//             ],
//           ),
//           if (currentRating > 0) ...[
//             const SizedBox(height: 8),
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: _getRatingColor(currentRating).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   _getRatingLabel(currentRating),
//                   style: TextStyle(
//                     color: _getRatingColor(currentRating),
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildTotalScoreRow() {
//     double totalScore = _calculateTotalScore();
//     double averageScore = totalScore / masteryOfSubjectCriteria.length;
//     int roundedAverage = averageScore.round();
    
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Total Score / Mean / Wtd. Mean',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 totalScore > 0 ? '${totalScore.toStringAsFixed(1)} / ${averageScore.toStringAsFixed(2)}' : 'Not rated',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           if (totalScore > 0) ...[
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Text('Overall Rating: '),
//                 ...List.generate(5, (index) {
//                   int starValue = index + 1;
//                   // Fill stars up to the rounded average
//                   bool isFilled = starValue <= roundedAverage;
//                   return Icon(
//                     isFilled ? Icons.star : Icons.star_border,
//                     color: Colors.amber[600],
//                     size: 20,
//                   );
//                 }),
//                 const SizedBox(width: 8),
//                 Text(
//                   _getRatingLabel(roundedAverage),
//                   style: TextStyle(
//                     color: _getRatingColor(roundedAverage),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     bool allRated = masteryOfSubjectCriteria.every((criterion) => 
//       ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
//     );

//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: allRated ? _submitEvaluation : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 32, 42, 68),
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Text(
//           allRated ? 'Submit Evaluation' : 'Please rate all criteria',
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }

//   double _calculateTotalScore() {
//     double total = 0;
//     for (var criterion in masteryOfSubjectCriteria) {
//       if (ratings.containsKey(criterion.id) && ratings[criterion.id] != null) {
//         total += ratings[criterion.id]!.toDouble();
//       }
//     }
//     return total;
//   }

//   String _getRatingLabel(int rating) {
//     switch (rating) {
//       case 5: return 'Outstanding';
//       case 4: return 'Very Satisfactory';
//       case 3: return 'Satisfactory';
//       case 2: return 'Fair';
//       case 1: return 'Poor';
//       default: return 'Not rated';
//     }
//   }

//   Color _getRatingColor(int rating) {
//     switch (rating) {
//       case 5: return Colors.green;
//       case 4: return Colors.lightGreen;
//       case 3: return Colors.yellow[700]!;
//       case 2: return Colors.orange;
//       case 1: return Colors.red;
//       default: return Colors.grey;
//     }
//   }

//   void _submitEvaluation() {
//     // Calculate final scores
//     double totalScore = _calculateTotalScore();
//     double averageScore = totalScore / masteryOfSubjectCriteria.length;
//     int roundedAverage = averageScore.round();
    
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Evaluation Submitted'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Total Score: ${totalScore.toStringAsFixed(1)}'),
//               Text('Average Score: ${averageScore.toStringAsFixed(2)}'),
//               Text('Overall Rating: ${_getRatingLabel(roundedAverage)}'),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   const Text('Stars: '),
//                   ...List.generate(5, (index) {
//                     int starValue = index + 1;
//                     bool isFilled = starValue <= roundedAverage;
//                     return Icon(
//                       isFilled ? Icons.star : Icons.star_border,
//                       color: Colors.amber[600],
//                       size: 20,
//                     );
//                   }),
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 // Reset form or navigate back
//                 setState(() {
//                   ratings.clear();
//                 });
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class EvaluationCriterion {
//   final String id;
//   final String text;

//   EvaluationCriterion({
//     required this.id,
//     required this.text,
//   });
// }

import 'package:flutter/material.dart';

class EvaluationForm extends StatefulWidget {
  const EvaluationForm({super.key});

  @override
  State<EvaluationForm> createState() => _EvaluationFormState();
}

class _EvaluationFormState extends State<EvaluationForm> {
  // Store ratings for each criterion
  Map<String, int> ratings = {};
  
  // Evaluation criteria for Mastery of Subject Matter
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
      id: 'motivation',
      text: '1. Uses motivation techniques that elicit student\'s interest',
    ),
    EvaluationCriterion(
      id: 'links_past',
      text: '2. Links the past with the present lesson',
    ),
    EvaluationCriterion(
      id: 'varied_strategies',
      text: '3. Uses varied strategies suited to the students\' needs',
    ),
    EvaluationCriterion(
      id: 'varied_types',
      text: '4. Asks varied types of questions',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Faculty Evaluation Form'),
        backgroundColor: const Color.fromARGB(255, 32, 42, 68),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInstructionsCard(),
            const SizedBox(height: 20),
            _buildRatingScaleCard(),
            const SizedBox(height: 20),
            _buildEvaluationSectionCard(),
            const SizedBox(height: 30),
            _buildSubmitButton(),
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

  Widget _buildEvaluationSectionCard() {
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
              child: const Text(
                'A. Mastery of Subject - Matter (25%)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ...masteryOfSubjectCriteria.map((criterion) => 
              _buildCriterionRow(criterion)
            ),
            const SizedBox(height: 20),
            _buildTotalScoreRow(),
            const SizedBox(height: 20),
            _buildCommentsAndSuggestionsSection(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Rating: ', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(width: 10),
              ...List.generate(5, (index) {
                int starValue = index + 1;
                // Star is filled if its value is <= current rating
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
            ],
          ),
          if (currentRating > 0) ...[
            const SizedBox(height: 8),
            Center(
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
          ],
        ],
      ),
    );
  }

  Widget _buildTotalScoreRow() {
    double totalScore = _calculateTotalScore();
    double averageScore = totalScore / masteryOfSubjectCriteria.length;
    int roundedAverage = averageScore.round();
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Total Score / Mean / Wtd. Mean
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Score / Mean / Wtd. Mean',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                totalScore > 0 ? '${totalScore.toStringAsFixed(1)} / ${averageScore.toStringAsFixed(2)} / ${(averageScore * 0.25).toStringAsFixed(2)}' : 'Not rated',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Overall MEAN/Desc. Equiv.
          if (totalScore > 0) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Overall MEAN / Desc. Equiv.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Row(
                  children: [
                    Text(
                      '${averageScore.toStringAsFixed(2)} / ',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      _getRatingLabel(roundedAverage),
                      style: TextStyle(
                        color: _getRatingColor(roundedAverage),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Star Rating Display
            Row(
              children: [
                const Text('Rating: ', style: TextStyle(fontWeight: FontWeight.w500)),
                ...List.generate(5, (index) {
                  int starValue = index + 1;
                  bool isFilled = starValue <= roundedAverage;
                  return Icon(
                    isFilled ? Icons.star : Icons.star_border,
                    color: Colors.amber[600],
                    size: 20,
                  );
                }),
                const SizedBox(width: 8),
                Text(
                  '(${averageScore.toStringAsFixed(2)})',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCommentsAndSuggestionsSection() {
    double totalScore = _calculateTotalScore();
    double averageScore = totalScore / masteryOfSubjectCriteria.length;
    
    if (totalScore == 0) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.comment, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  'Comments/Suggestions:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Complete the evaluation to receive personalized feedback and suggestions.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }

    // Generate automated comments and suggestions
    EvaluationFeedback feedback = _generateRealTimeFeedback(averageScore, ratings);
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _getRatingColor(averageScore.round()).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _getRatingColor(averageScore.round()).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.comment,
                color: _getRatingColor(averageScore.round()),
              ),
              const SizedBox(width: 8),
              const Text(
                'Comments/Suggestions:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Overall Performance Comment
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _getPerformanceIcon(averageScore),
                      color: _getRatingColor(averageScore.round()),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Overall Performance:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getRatingColor(averageScore.round()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  feedback.overallComment,
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),
          
          // Specific Area Comments
          if (feedback.specificComments.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.analytics, color: Colors.blue[600], size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Specific Areas:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...feedback.specificComments.map((comment) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(
                            color: _getRatingColor(averageScore.round()),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            comment,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
          
          // Actionable Suggestions
          if (feedback.suggestions.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.orange[600], size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Recommendations:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...feedback.suggestions.take(3).map((suggestion) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('💡 ', style: TextStyle(fontSize: 12)),
                        Expanded(
                          child: Text(
                            suggestion,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
          
          // Performance Indicator
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getRatingColor(averageScore.round()).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: _getRatingColor(averageScore.round()),
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  _getPerformanceIndicator(averageScore),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: _getRatingColor(averageScore.round()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getPerformanceIcon(double score) {
    if (score >= 4.5) return Icons.emoji_events;
    if (score >= 3.5) return Icons.thumb_up;
    if (score >= 2.5) return Icons.info;
    if (score >= 1.5) return Icons.warning;
    return Icons.error;
  }

  String _getPerformanceIndicator(double score) {
    if (score >= 4.5) return 'Exceptional Performance - Role Model';
    if (score >= 3.5) return 'Strong Performance - Above Average';
    if (score >= 2.5) return 'Adequate Performance - Meets Standards';
    if (score >= 1.5) return 'Below Average - Needs Improvement';
    return 'Poor Performance - Immediate Action Required';
  }

  Widget _buildSubmitButton() {
    bool allRated = masteryOfSubjectCriteria.every((criterion) => 
      ratings.containsKey(criterion.id) && ratings[criterion.id] != null && ratings[criterion.id]! > 0
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: allRated ? _submitEvaluation : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 32, 42, 68),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          allRated ? 'Submit Evaluation' : 'Please rate all criteria',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  double _calculateTotalScore() {
    double total = 0;
    for (var criterion in masteryOfSubjectCriteria) {
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

  // Generate real-time feedback for the comments section
  EvaluationFeedback _generateRealTimeFeedback(double averageScore, Map<String, int> ratings) {
    List<String> specificComments = [];
    List<String> suggestions = [];
    String overallComment = '';

    // Analyze individual criteria for specific comments
    ratings.forEach((criterionId, rating) {
      String criterionName = _getCriterionName(criterionId);
      
      if (rating >= 4) {
        specificComments.add('Strong performance in $criterionName (${_getRatingLabel(rating)})');
      } else if (rating <= 2) {
        specificComments.add('$criterionName needs attention (${_getRatingLabel(rating)})');
      }
    });

    // Generate suggestions based on weak areas
    ratings.forEach((criterionId, rating) {
      if (rating <= 2) {
        suggestions.addAll(_getSpecificSuggestions(criterionId, rating));
      }
    });

    // Generate overall comment based on average score
    if (averageScore >= 4.5) {
      overallComment = 'Exceptional teaching performance! You demonstrate outstanding mastery of subject matter and serve as an excellent role model for other faculty members.';
    } else if (averageScore >= 3.5) {
      overallComment = 'Very good teaching performance! You show strong subject mastery with consistent delivery. Minor refinements could elevate your teaching to outstanding levels.';
    } else if (averageScore >= 2.5) {
      overallComment = 'Satisfactory teaching performance. You meet basic teaching standards but there are opportunities for improvement in several key areas.';
    } else if (averageScore >= 1.5) {
      overallComment = 'Teaching performance requires improvement. Focus on developing stronger subject mastery and more effective teaching strategies.';
    } else {
      overallComment = 'Teaching performance needs immediate attention. Consider seeking mentorship and professional development to improve effectiveness.';
    }

    return EvaluationFeedback(
      overallComment: overallComment,
      specificComments: specificComments,
      suggestions: suggestions,
      averageScore: averageScore,
    );
  }

  // Generate feedback for submission dialog
  EvaluationFeedback _generateFeedback(double averageScore, Map<String, int> ratings) {
    List<String> strengths = [];
    List<String> improvements = [];
    List<String> suggestions = [];
    String overallComment = '';

    // Analyze individual criteria
    ratings.forEach((criterionId, rating) {
      String criterionName = _getCriterionName(criterionId);
      
      if (rating >= 4) {
        strengths.add('Excellent performance in $criterionName');
      } else if (rating <= 2) {
        improvements.add('Needs improvement in $criterionName');
        suggestions.addAll(_getSpecificSuggestions(criterionId, rating));
      }
    });

    // Generate overall comment based on average score
    if (averageScore >= 4.5) {
      overallComment = 'Outstanding performance! You demonstrate exceptional teaching skills and subject mastery. Continue to serve as a role model for other faculty members.';
    } else if (averageScore >= 3.5) {
      overallComment = 'Very satisfactory performance! You show strong teaching abilities with room for minor enhancements. Keep up the excellent work.';
    } else if (averageScore >= 2.5) {
      overallComment = 'Satisfactory performance. You meet basic teaching standards but there are several areas where focused improvement could enhance your effectiveness.';
    } else if (averageScore >= 1.5) {
      overallComment = 'Fair performance. Significant improvement is needed in multiple areas. Consider seeking mentorship and professional development opportunities.';
    } else {
      overallComment = 'Performance needs immediate attention. Comprehensive support and training are recommended to meet teaching standards.';
    }

    return EvaluationFeedback(
      overallComment: overallComment,
      strengths: strengths,
      improvements: improvements,
      suggestions: suggestions,
      averageScore: averageScore,
    );
  }

  String _getCriterionName(String criterionId) {
    switch (criterionId) {
      case 'logical_presentation': return 'logical lesson presentation';
      case 'relates_to_issues': return 'relating lessons to current issues';
      case 'beyond_content': return 'providing explanations beyond textbook content';
      case 'independent_teaching': return 'teaching without heavy reliance on notes';
      default: return 'this area';
    }
  }

  List<String> _getSpecificSuggestions(String criterionId, int rating) {
    switch (criterionId) {
      case 'logical_presentation':
        return [
          'Create detailed lesson outlines with clear learning objectives',
          'Use concept mapping to organize content flow',
          'Practice transitions between topics to maintain logical sequence'
        ];
      case 'relates_to_issues':
        return [
          'Stay updated with current events and local news',
          'Incorporate real-world examples and case studies',
          'Encourage students to share relevant experiences'
        ];
      case 'beyond_content':
        return [
          'Research additional resources and supplementary materials',
          'Attend professional development workshops',
          'Connect with industry professionals for practical insights'
        ];
      case 'independent_teaching':
        return [
          'Practice lesson delivery without notes',
          'Create memory aids and visual cues',
          'Record yourself teaching to identify areas for improvement'
        ];
      default:
        return ['Seek feedback from colleagues and students'];
    }
  }

  void _submitEvaluation() {
    // Calculate final scores
    double totalScore = _calculateTotalScore();
    double averageScore = totalScore / masteryOfSubjectCriteria.length;
    int roundedAverage = averageScore.round();
    
    // Generate automated feedback
    EvaluationFeedback feedback = _generateFeedback(averageScore, ratings);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Evaluation Submitted Successfully!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        'Detailed feedback has been generated and saved to your evaluation record.',
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

class EvaluationFeedback {
  final String overallComment;
  final List<String> strengths;
  final List<String> improvements;
  final List<String> suggestions;
  final List<String> specificComments;
  final double averageScore;

  EvaluationFeedback({
    required this.overallComment,
    this.strengths = const [],
    this.improvements = const [],
    this.suggestions = const [],
    this.specificComments = const [],
    required this.averageScore,
  });
}