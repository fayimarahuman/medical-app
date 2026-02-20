import 'package:flutter/material.dart';

/// Doctor portal showing assigned patients
class DoctorPortalScreen extends StatelessWidget {
  const DoctorPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample patients data (replace with API)
    final patients = [
      {'name': 'Fayima Rahuman', 'age': '22', 'condition': 'Routine Checkup'},
      {'name': 'Alice Johnson', 'age': '30', 'condition': 'BP Follow-up'},
      {'name': 'Mark Lee', 'age': '40', 'condition': 'Diabetes Management'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Patients",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A8EA0), // professional medical teal
            ),
          ),
          const SizedBox(height: 20),

          Column(
            children: patients.map(
              (p) => Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF0A8EA0),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    p['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Age: ${p['age']} | Condition: ${p['condition']}"),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF0A8EA0)),
                  onTap: () {
                    // Navigate to patient details screen (future feature)
                  },
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}
