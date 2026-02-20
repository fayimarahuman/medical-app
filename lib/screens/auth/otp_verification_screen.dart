import 'package:flutter/material.dart';
import '../../services/local_auth_service.dart';
import '../dashboard/dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  void verifyOtp() async {
    final otp = _otpController.text.trim();

    if (otp.length != 6) {
      _showMessage("Enter a 6-digit OTP");
      return;
    }

    setState(() => _isLoading = true);

    final success = await LocalAuthService.verifyOtp(otp);

    setState(() => _isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      _showMessage("Invalid OTP");
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(labelText: "Enter OTP"),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _isLoading ? null : verifyOtp,
              style:
                  ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
