import 'package:flutter/material.dart';
import '../../services/local_auth_service.dart';
import 'otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void sendOtp() async {
    final email = _emailController.text.trim();

    if (!email.contains("@")) {
      _showMessage("Enter a valid email");
      return;
    }

    setState(() => _isLoading = true);

    await LocalAuthService.sendOtp(email);

    setState(() => _isLoading = false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpVerificationScreen(email: email),
      ),
    );
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/forgot_bg.png',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : sendOtp,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
