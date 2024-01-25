import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            'Student Screen',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
    );
  }
}
