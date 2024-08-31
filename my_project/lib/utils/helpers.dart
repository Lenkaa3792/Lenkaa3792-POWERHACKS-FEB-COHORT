import 'package:flutter/material.dart';

String formatCurrency(double amount) {
  return '\$${amount.toStringAsFixed(2)}';
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger
