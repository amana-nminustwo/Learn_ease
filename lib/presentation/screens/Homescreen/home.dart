import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_ease/presentation/screens/Homescreen/widgets/calendar_widget.dart';
import 'package:learn_ease/presentation/screens/Homescreen/widgets/subject_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> questionPapers = [
      {
        'color': const Color(0xFF6499DF),
        'image': 'assets/images/blue.png',
        'title': 'Programming in Python',
        'description':
        'Python is a high-level, interpreted programming language known for its simplicity.',
        'credits': 5,
      },
      {
        'color': const Color(0xFFCB97FF),
        'image': 'assets/images/pink.png',
        'title': 'Database Management Systems',
        'description':
        'DBMS provides efficient data management and querying capabilities for complex systems.',
        'credits': 4,
      },
      {
        'color': const Color(0xFFFFBB00),
        'image': 'assets/images/yellow.png',
        'title': 'Operating Systems',
        'description':
        'An OS manages computer hardware and software resources, providing services to programs.',
        'credits': 3,
      },
      {
        'color': const Color(0xFFFF4C30),
        'image': 'assets/images/orange.png',
        'title': 'Data Structures',
        'description':
        'Essential for efficient algorithms and memory optimization in software design.',
        'credits': 5,
      },
      {
        'color': const Color(0xFF5DCE1C),
        'image': 'assets/images/green.png',
        'title': 'Computer Networks',
        'description':
        'Learn how data is transmitted between systems and how networks operate efficiently.',
        'credits': 4,
      },
      {
        'color': const Color(0xFFDF64B2),
        'image': 'assets/images/violet.png',
        'title': 'Machine Learning Basics',
        'description':
        'Explore algorithms that enable systems to learn patterns and make intelligent decisions.',
        'credits': 5,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              // Greeting and date
              Row(
                children: [
                  const CircleAvatar(
                    radius: 29,
                    backgroundImage: AssetImage('assets/images/john.png'),
                  ),
                  const SizedBox(width: 38),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, John Doe',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Color(0XFF444444),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Today 18 Nov',
                        style: GoogleFonts.inter(
                          color: Color(0XFF444444),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // New Question Papers card
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xFF909AFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -5,
                      top: -50,
                      child: Image.asset(
                        'assets/images/questionpaper.png',
                        height: 170,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 25,
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 40) / 2 - 30,
                        child: Text(
                          'New Question Papers and Exam Updates for 2025 Batch',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Calendar widget
              const CalendarWidget(),

              const SizedBox(height: 20),

              // Subject cards
              ...questionPapers.map((paper) => SubjectCard(paper: paper)),
            ],
          ),
        ),
      ),
    );
  }
}
