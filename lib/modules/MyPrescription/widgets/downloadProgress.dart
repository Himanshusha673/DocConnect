import 'package:flutter/material.dart';

class DownloadProgressDialog extends StatelessWidget {
  final double progress;

  const DownloadProgressDialog({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Downloading Prescription'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text('Downloading: ${progress.toStringAsFixed(2)}%'),
        ],
      ),
    );
  }
}
