import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/local_auth_service.dart';
import '../dashboard/dashboard_screen.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _selectedRole = 'patient'; // default

  void loginUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (!email.contains("@")) {
      _showMessage("Enter a valid email");
      return;
    }
    if (password.isEmpty) {
      _showMessage("Enter your password");
      return;
    }

    setState(() => _isLoading = true);

    final success = await LocalAuthService.loginUser(email, password);

    setState(() => _isLoading = false);

    if (success) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_role', _selectedRole);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
    } else {
      _showMessage("Incorrect email or password");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            // Decorative image (kept)
            Image.asset(
              'assets/images/auth_bg.png',
              width: 250,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const Text(
              "Login",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
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
                const Text("Login as: "),
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
              onPressed: _isLoading ? null : loginUser,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Login"),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
              ),
              child: const Text("Forgot Password?"),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
