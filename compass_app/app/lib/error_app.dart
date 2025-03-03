// Simple error app that can be shown before the main app initializes
import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:flutter/services.dart'; // Import for SystemNavigator

class ErrorApp extends StatelessWidget {
  final String errorMessage;
  final bool canRetry;

  const ErrorApp({
    super.key,
    required this.errorMessage,
    this.canRetry = false,
  });

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
                  onPressed: () {
                    if (canRetry) {
                      // Restart the app
                      RestartAppHelper.restartApp();
                    } else {
                      // Exit the app
                      SystemNavigator.pop();
                    }
                  },
                  child: Text(canRetry ? 'Thử lại' : 'Thoát ứng dụng'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Helper class to restart the app
class RestartAppHelper {
  static void restartApp() {
    // This is meant to be replaced with your app's restart mechanism
    // For example, you might want to call main() again or use a package like flutter_phoenix
    // For now, we'll just exit to keep it simple
    SystemNavigator.pop();
  }
}
