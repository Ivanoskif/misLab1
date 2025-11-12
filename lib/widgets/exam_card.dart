import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    final formattedDate = dateFormat.format(exam.dateTime);

    return Card(
      color: isPast ? Colors.grey.shade300 : Colors.teal.shade50,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          Icons.school,
          color: isPast ? Colors.grey : Colors.teal,
        ),
        title: Text(
          exam.subjectName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(formattedDate),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
