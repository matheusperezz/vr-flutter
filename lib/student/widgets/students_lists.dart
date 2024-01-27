import 'package:flutter/material.dart';
import 'package:vr_application/course/store/course_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/student/store/student_store.dart';

import '../../_core/routes_names.dart';

class StudentListWidget extends StatefulWidget {
  const StudentListWidget({super.key});

  @override
  State<StudentListWidget> createState() => _StudentListWidgetState();
}

class _StudentListWidgetState extends State<StudentListWidget> {
  final StudentStore _studentStore = StudentStore();

  @override
  void initState() {
    super.initState();
    _studentStore.fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (BuildContext context) {
          if (_studentStore.students.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: _studentStore.students.length,
            itemBuilder: (BuildContext context, int index) {
              final student = _studentStore.students[index];
              return ListTile(
                  title: Text(student.name),
                  subtitle: Text('Certamente um aluno'),
                  onTap: () {
                    for (var course in student.courses) {
                      print('Student id: ${student.id} course id: ${course.id} course description: ${course.description}');
                    }
                  });
            },
          );
        },
      ),
    );
  }
}
