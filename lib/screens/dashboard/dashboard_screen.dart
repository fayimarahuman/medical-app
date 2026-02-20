import 'package:flutter/material.dart';
import 'appointments_screen.dart';
import 'doctor_portal_screen.dart';
import 'patient_portal_screen.dart';
import 'patient_profile_screen.dart';
import 'doctor_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  String? userRole; // null initially, will load from SharedPreferences
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('user_role') ?? 'patient';
    setState(() {
      userRole = role;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator until role is loaded
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Pages for patients
    final List<Widget> patientPages = [
      const AppointmentsScreen(),
      const PatientPortalScreen(),
      const PatientProfileScreen(), // updated
    ];

    // Pages for doctors
    final List<Widget> doctorPages = [
      const AppointmentsScreen(),
      const DoctorPortalScreen(),
      const DoctorProfileScreen(), // updated
    ];

    final pages = userRole == 'patient' ? patientPages : doctorPages;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A8EA0), // professional teal
        title: Text(userRole == 'patient' ? 'Patient Dashboard' : 'Doctor Dashboard'),
        centerTitle: true,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0A8EA0),
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.white,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Portal'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
