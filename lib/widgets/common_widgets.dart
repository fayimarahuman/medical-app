import 'package:flutter/material.dart';

/// Reusable Button Widget
Widget customButton({required String text, required VoidCallback onPressed, Color? color}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: color ?? Colors.blue.shade700),
      child: Text(text),
    ),
  );
}

/// Reusable Card for Lists (e.g., appointments or patients)
Widget customCard({required Widget child}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: child,
    ),
  );
}
