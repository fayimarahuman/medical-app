import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthService {
  /// Save registered user details locally
  static Future<void> saveUser(String name, String email, String password, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
    await prefs.setString('user_role', role); // save role
  }

  /// Get stored user role
  static Future<String> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_role') ?? 'patient';
  }

  /// Check if login details match stored details
  static Future<bool> loginUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('user_email');
    final savedPassword = prefs.getString('user_password');
    return email == savedEmail && password == savedPassword;
  }

  /// Fake OTP sending (frontend only)
  static Future<String> sendOtp(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return "123456"; // Always the OTP for demo
  }

  /// Verify OTP (always 123456)
  static Future<bool> verifyOtp(String otp) async {
    return otp == "123456";
  }
}
