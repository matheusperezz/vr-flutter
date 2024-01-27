import 'package:flutter/material.dart';
import 'package:vr_application/student/widgets/students_lists.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: StudentListWidget(),
        )
    );
  }
}
