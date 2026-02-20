import 'package:flutter/material.dart';
import '../auth/auth_screen.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  Map<String, String> doctorInfo = {
    'name': 'Dr. John Doe',
    'email': 'john.doe@example.com',
    'phone': '+256700111222',
    'specialization': 'General Medicine',
    'clinicHours': 'Mon-Fri 9AM-5PM',
  };

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _specializationController;
  late final TextEditingController _clinicHoursController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: doctorInfo['name']);
    _emailController = TextEditingController(text: doctorInfo['email']);
    _phoneController = TextEditingController(text: doctorInfo['phone']);
    _specializationController = TextEditingController(text: doctorInfo['specialization']);
    _clinicHoursController = TextEditingController(text: doctorInfo['clinicHours']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _specializationController.dispose();
    _clinicHoursController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      doctorInfo['name'] = _nameController.text;
      doctorInfo['email'] = _emailController.text;
      doctorInfo['phone'] = _phoneController.text;
      doctorInfo['specialization'] = _specializationController.text;
      doctorInfo['clinicHours'] = _clinicHoursController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Doctor profile updated')));
  }

  void _logout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Doctor Profile",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Full Name')),
          const SizedBox(height: 10),
          TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 10),
          TextField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Phone')),
          const SizedBox(height: 10),
          TextField(controller: _specializationController, decoration: const InputDecoration(labelText: 'Specialization')),
          const SizedBox(height: 10),
          TextField(controller: _clinicHoursController, decoration: const InputDecoration(labelText: 'Clinic Hours')),
          const SizedBox(height: 25),
          ElevatedButton(onPressed: _saveProfile, style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)), child: const Text("Save Changes")),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: _logout, style: ElevatedButton.styleFrom(backgroundColor: Colors.red, minimumSize: const Size.fromHeight(50)), child: const Text("Logout")),
        ],
      ),
    );
  }
}
