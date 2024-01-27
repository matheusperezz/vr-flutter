import 'package:flutter/material.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/widgets/course_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: CourseListWidget(),
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Modular.to.navigate(AppRoutes.createCoursePage);
        },
        label: const Text('Criar curso'),
        icon: const Icon(Icons.add
      )
      )
    );
  }
}
