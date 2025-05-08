import 'package:flutter/material.dart';

massengerMessage({
  required BuildContext context,
  required String message,
  Color color = const Color(0xFF504E4E),
}) {
  return ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
}
