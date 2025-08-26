import 'package:flutter/material.dart';

class FacultySchedulePage extends StatelessWidget {
  const FacultySchedulePage({super.key});

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
              const Text('My Schedule', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.today),
                    label: const Text('Today'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle),
                    label: const Text('Add Event'),
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
                    _buildScheduleStatCardBox('Today\'s Classes', '3', Icons.class_, Colors.blue),
                    const SizedBox(height: 12),
                    _buildScheduleStatCardBox('Office Hours', '2', Icons.access_time, Colors.green),
                    const SizedBox(height: 12),
                    _buildScheduleStatCardBox('Meetings', '1', Icons.meeting_room, Colors.orange),
                  ],
                );
              }
              return Row(
                children: [
                  _buildScheduleStatCard('Today\'s Classes', '3', Icons.class_, Colors.blue),
                  const SizedBox(width: 20),
                  _buildScheduleStatCard('Office Hours', '2', Icons.access_time, Colors.green),
                  const SizedBox(width: 20),
                  _buildScheduleStatCard('Meetings', '1', Icons.meeting_room, Colors.orange),
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
                      _buildWeeklyScheduleCard(),
                      const SizedBox(height: 20),
                      _buildTodayScheduleCard(),
                    ],
                  );
                }
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildWeeklyScheduleCard(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildTodayScheduleCard(),
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

  Widget _buildScheduleStatCardBox(String title, String value, IconData icon, Color color) {
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

  Widget _buildScheduleStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(child: _buildScheduleStatCardBox(title, value, icon, color));
  }

  Widget _buildWeeklyScheduleCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weekly Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(color: Colors.grey[300]!),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                    5: FlexColumnWidth(2),
                  },
                  children: [
                    _buildTableHeader(),
                    _buildTimeSlot('8:00 AM', '', '', '', '', ''),
                    _buildTimeSlot('9:00 AM', 'CS 101\nRoom 201', '', 'CS 101\nRoom 201', '', 'CS 101\nRoom 201'),
                    _buildTimeSlot('10:00 AM', '', 'CS 401\nRoom 305', '', 'CS 401\nRoom 305', ''),
                    _buildTimeSlot('11:00 AM', 'Office Hours\nRoom 401', '', 'Office Hours\nRoom 401', '', ''),
                    _buildTimeSlot('12:00 PM', '', '', '', '', ''),
                    _buildTimeSlot('1:00 PM', 'CS 450\nRoom 102', '', 'CS 450\nRoom 102', '', 'CS 450\nRoom 102'),
                    _buildTimeSlot('2:00 PM', '', 'CS 201\nRoom 203', '', 'CS 201\nRoom 203', ''),
                    _buildTimeSlot('3:00 PM', '', '', '', '', 'CS 499\nRoom 401'),
                    _buildTimeSlot('4:00 PM', 'CS 301\nRoom 104', '', 'CS 301\nRoom 104', '', 'CS 499\nRoom 401'),
                    _buildTimeSlot('5:00 PM', '', '', '', '', 'CS 499\nRoom 401'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayScheduleCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today\'s Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildTodayItem('9:00 AM - 10:30 AM', 'CS 101 - Introduction to Programming', 'Room 201', Colors.blue),
                  _buildTodayItem('11:00 AM - 12:00 PM', 'Office Hours', 'Room 401', Colors.green),
                  _buildTodayItem('1:00 PM - 2:30 PM', 'CS 450 - Machine Learning', 'Room 102', Colors.purple),
                  _buildTodayItem('3:00 PM - 4:00 PM', 'Faculty Meeting', 'Conference Room A', Colors.orange),
                  _buildTodayItem('4:00 PM - 5:30 PM', 'CS 301 - Database Systems', 'Room 104', Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Upcoming This Week', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildUpcomingItem('Tomorrow', 'Department Meeting', '2:00 PM'),
            _buildUpcomingItem('Wednesday', 'Student Advising', '10:00 AM - 12:00 PM'),
            _buildUpcomingItem('Friday', 'Research Presentation', '3:00 PM'),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[100]),
      children: [
        _buildHeaderCell('Time'),
        _buildHeaderCell('Monday'),
        _buildHeaderCell('Tuesday'),
        _buildHeaderCell('Wednesday'),
        _buildHeaderCell('Thursday'),
        _buildHeaderCell('Friday'),
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  TableRow _buildTimeSlot(String time, String mon, String tue, String wed, String thu, String fri) {
    return TableRow(
      children: [
        _buildTimeCell(time),
        _buildScheduleCell(mon),
        _buildScheduleCell(tue),
        _buildScheduleCell(wed),
        _buildScheduleCell(thu),
        _buildScheduleCell(fri),
      ],
    );
  }

  Widget _buildTimeCell(String time) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        time,
        style: const TextStyle(fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildScheduleCell(String content) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: content.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                content,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            )
          : const SizedBox(height: 40),
    );
  }

  Widget _buildTodayItem(String time, String title, String location, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(Icons.schedule, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
            Text(location, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildUpcomingItem(String day, String event, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.event, size: 16, color: Colors.blue[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                Text('$day • $time', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}