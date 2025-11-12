import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subjectName: 'Структурно програмирање', dateTime: DateTime(2025, 11, 15, 8, 0), rooms: ['Сите лаборатории']),
    Exam(subjectName: 'Калкулус', dateTime: DateTime(2025, 11, 21, 14, 30), rooms: ['Б1','Б2.2','Б2.3','АМФ ФИНКИ Г']),
    Exam(subjectName: 'Бази на податоци', dateTime: DateTime(2025, 11, 19, 8, 0), rooms: ['Сите лаборатории']),
    Exam(subjectName: 'Оперативни системи', dateTime: DateTime(2025, 2, 2, 8, 30), rooms: ['Сите лаборатории']),
    Exam(subjectName: 'Компјутерски мрежи', dateTime: DateTime(2025, 11, 22, 8, 0), rooms: ['Сите лаборатории']),
    Exam(subjectName: 'Интернет технологии', dateTime: DateTime(2025, 2, 10, 13, 0), rooms: ['Лаб117','Лаб200АБ','Лаб215','Лаб138']),
    Exam(subjectName: 'Објектно ориентирано програмирање', dateTime: DateTime(2025, 2, 12, 9, 0), rooms: ['Лаб2','Лаб3','Лаб12','Лаб117','Лаб215']),
    Exam(subjectName: 'Алгоритми и структури на податоци', dateTime: DateTime(2025, 11, 22, 8, 0), rooms: ['Лаб2','Лаб3','Лаб12','Лаб117','Лаб215']),
    Exam(subjectName: 'Мобилни информациски системи', dateTime: DateTime(2025, 12, 15, 18, 0), rooms: ['Лаб117','Лаб200АБ','Лаб215','Лаб138']),
    Exam(subjectName: 'Вештачка интелегенција', dateTime: DateTime(2025, 2, 20, 11, 30), rooms: ['Лаб2','Лаб3','Лаб12','Лаб13','Лаб138']),
    Exam(subjectName: 'Дизајн и архитектура на софтвер', dateTime: DateTime(2025, 11, 18, 19, 00), rooms: ['Лаб2','Лаб3','Лаб12','Лаб117','Лаб215']),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221038'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExamDetailsScreen(exam: exam),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal.shade100,
            child: Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
