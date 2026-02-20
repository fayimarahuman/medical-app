import 'package:flutter/material.dart';
import '../../services/local_auth_service.dart';
import '../dashboard/dashboard_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _selectedRole = 'patient';

  void registerUser() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final role = _selectedRole;

    if (name.isEmpty) {
      _showMessage("Name is required");
      return;
    }
    if (!email.contains("@")) {
      _showMessage("Enter a valid email");
      return;
    }
    if (password.length < 6) {
      _showMessage("Password must be at least 6 characters");
      return;
    }

    setState(() => _isLoading = true);
    await LocalAuthService.saveUser(name, email, password, role);
    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DashboardScreen()),
    );
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(
              'assets/images/auth_bg.png',
              width: 250,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text("Register as: "),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedRole,
                  items: const [
                    DropdownMenuItem(value: 'patient', child: Text('Patient')),
                    DropdownMenuItem(value: 'doctor', child: Text('Doctor')),
                  ],
                  onChanged: (val) {
                    setState(() => _selectedRole = val!);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : registerUser,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
