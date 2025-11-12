import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailsScreen({super.key, required this.exam});

  String _timeUntilExam() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) return 'Испитот помина.';
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return 'Преостануваат: $days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
    DateFormat('dd.MM.yyyy – HH:mm').format(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📘 Предмет: ${exam.subjectName}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('📅 Датум и време: $formattedDate',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('🏫 Простории: ${exam.rooms.join(', ')}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('⏳ ${_timeUntilExam()}',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}
