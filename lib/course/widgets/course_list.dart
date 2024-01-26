import 'package:flutter/material.dart';
import 'package:vr_application/course/store/course_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../_core/routes_names.dart';

class CourseListWidget extends StatefulWidget {
  const CourseListWidget({super.key});

  @override
  State<CourseListWidget> createState() => _CourseListWidgetState();
}

class _CourseListWidgetState extends State<CourseListWidget> {
  final CourseStore _courseStore = CourseStore();

  @override
  void initState() {
    super.initState();
    _courseStore.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (BuildContext context) {
          if (_courseStore.courses.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: _courseStore.courses.length,
            itemBuilder: (BuildContext context, int index) {
              final course = _courseStore.courses[index];
              return ListTile(
                  title: Text(course.description),
                  subtitle: Text(course.syllabus),
                  onTap: () {
                    print('route: ${AppRoutes.course} arguments: ${course.id}');
                    Modular.to.navigate('${AppRoutes.course}/${course.id}');
                  });
            },
          );
        },
      ),
    );
  }
}
