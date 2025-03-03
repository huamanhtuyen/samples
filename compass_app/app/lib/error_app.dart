// Simple error app that can be shown before the main app initializes
import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:flutter/services.dart'; // Import for SystemNavigator

class ErrorApp extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const ErrorApp({super.key, required this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Đã xảy ra lỗi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onRetry ?? () => SystemNavigator.pop(),
                  child: const Text('Thoát ứng dụng'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
