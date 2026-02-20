import 'package:flutter/material.dart';

class PatientPortalScreen extends StatelessWidget {
  const PatientPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample patient info
    final patientInfo = {'name': 'Fayima Rahuman', 'age': '22', 'bloodType': 'O+'};

    // Health metrics
    final metrics = [
      {'metric': 'Heart Rate', 'value': '78 bpm'},
      {'metric': 'Blood Pressure', 'value': '120/80 mmHg'},
      {'metric': 'Weight', 'value': '65 kg'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Patient Portal",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A8EA0),
            ),
          ),
          const SizedBox(height: 20),

          // Patient Info Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${patientInfo['name']}"),
                  Text("Age: ${patientInfo['age']}"),
                  Text("Blood Type: ${patientInfo['bloodType']}"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Health Metrics",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A8EA0),
            ),
          ),
          const SizedBox(height: 10),

          Column(
            children: metrics
                .map(
                  (m) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.red),
                      title: Text(m['metric']!),
                      trailing: Text(m['value']!),
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 20),
          // Quick links
          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A8EA0),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildActionCard(Icons.add_box, "Book Appointment"),
              _buildActionCard(Icons.receipt, "Medical Records"),
              _buildActionCard(Icons.message, "Messages"),
              _buildActionCard(Icons.health_and_safety, "Health Tips"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String label) {
    return SizedBox(
      width: 160,
      height: 100,
      child: Card(
        color: Colors.teal.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 36, color: const Color(0xFF0A8EA0)),
                const SizedBox(height: 8),
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
