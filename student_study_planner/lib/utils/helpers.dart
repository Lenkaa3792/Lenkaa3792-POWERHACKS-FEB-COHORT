import 'dart:math';

String generateUniqueId() {
  final random = Random();
  return String.fromCharCodes(
    List.generate(10, (_) => random.nextInt(26) + 65),
  );
}

void logMessage(String message) {
  final timestamp = DateTime.now().toIso8601String();
  print("[$timestamp] $message");
}
