import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample appointment data (replace with API)
    final appointments = [
      {
        'doctor': 'Dr. John Doe',
        'date': '2025-11-10',
        'time': '10:00 AM',
        'duration': '30 mins',
        'status': 'Upcoming'
      },
      {
        'doctor': 'Dr. Alice Smith',
        'date': '2025-11-12',
        'time': '2:00 PM',
        'duration': '45 mins',
        'status': 'Upcoming'
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Appointments",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A8EA0),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: appointments.map(
              (a) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.calendar_today, color: Color(0xFF0A8EA0)),
                  title: Text(a['doctor']!),
                  subtitle: Text(
                      "${a['date']} at ${a['time']} | Duration: ${a['duration']}"),
                  trailing: Chip(
                    label: Text(a['status']!),
                    backgroundColor: a['status'] == 'Upcoming'
                        ? Colors.green.shade100
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
