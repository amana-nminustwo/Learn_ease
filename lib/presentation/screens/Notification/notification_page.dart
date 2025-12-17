import 'package:flutter/material.dart';
import 'package:learn_ease/presentation/screens/Notification/widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "New question papers added",
        "subtitle": "2019 Scheme",
        "date": "26/11/2025",
      },
      {
        "title": "New question papers added",
        "subtitle": "2019 Scheme",
        "date": "26/11/2025",
      },
      {
        "title": "New question papers added",
        "subtitle": "2019 Scheme",
        "date": "26/11/2025",
      },
      {
        "title": "New question papers added",
        "subtitle": "2019 Scheme",
        "date": "26/11/2025",
      },
      {
        "title": "Semester exam schedule released",
        "subtitle": "2020 Scheme",
        "date": "28/11/2025",
      },
      {
        "title": "Updated syllabus uploaded",
        "subtitle": "2021 Scheme",
        "date": "30/11/2025",
      },
      {
        "title": "Internal marks published",
        "subtitle": "2019 Scheme",
        "date": "02/12/2025",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF7B61FF),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 90),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: 'Mooxy',
                        color: Color(0xFFF9F9F9), // milky white
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // White background container (bottom section)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3F4FF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Notification section container
            Positioned(
              top: 100,
              left: 30,
              right: 30,
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    return NotificationItem(
                      title: item['title']!,
                      subtitle: item['subtitle']!,
                      date: item['date']!,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
