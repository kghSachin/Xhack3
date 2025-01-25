import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/chat/constants.dart';

class TutorPage extends ConsumerWidget {
  const TutorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 4,
        title: const Text(
          'Tutor',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
