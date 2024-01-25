import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            'Course Screen',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
    );
  }
}