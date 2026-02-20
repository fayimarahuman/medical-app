import 'package:flutter/material.dart';
import '../auth/auth_screen.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  _PatientProfileScreenState createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  Map<String, String> patientInfo = {
    'name': 'Fayima Rahuman',
    'email': 'fayima@example.com',
    'phone': '+256700000000',
    'bloodGroup': 'O+',
    'allergies': 'None',
  };

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _bloodGroupController;
  late final TextEditingController _allergiesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: patientInfo['name']);
    _emailController = TextEditingController(text: patientInfo['email']);
    _phoneController = TextEditingController(text: patientInfo['phone']);
    _bloodGroupController = TextEditingController(text: patientInfo['bloodGroup']);
    _allergiesController = TextEditingController(text: patientInfo['allergies']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bloodGroupController.dispose();
    _allergiesController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      patientInfo['name'] = _nameController.text;
      patientInfo['email'] = _emailController.text;
      patientInfo['phone'] = _phoneController.text;
      patientInfo['bloodGroup'] = _bloodGroupController.text;
      patientInfo['allergies'] = _allergiesController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Patient profile updated')));
  }

  void _logout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Profile'),
        backgroundColor: const Color(0xFF0A8EA0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Full Name')),
            const SizedBox(height: 10),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 10),
            TextField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Phone')),
            const SizedBox(height: 10),
            TextField(controller: _bloodGroupController, decoration: const InputDecoration(labelText: 'Blood Group')),
            const SizedBox(height: 10),
            TextField(controller: _allergiesController, decoration: const InputDecoration(labelText: 'Allergies')),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text("Save Changes")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, minimumSize: const Size.fromHeight(50)),
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
