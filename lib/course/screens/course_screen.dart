import 'package:flutter/material.dart';
import 'package:vr_application/course/widgets/course_list.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: CourseListWidget(),
    ));
  }
}
