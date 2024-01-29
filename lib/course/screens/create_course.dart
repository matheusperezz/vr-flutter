import 'package:flutter/material.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/store/course_store.dart';
import 'package:vr_application/_core/models/course.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({super.key});

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final CourseStore _courseStore = CourseStore();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _syllabusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Criando um curso',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _syllabusController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ementa',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final CreateCourseDTO newCourse = CreateCourseDTO(
                  description: _descriptionController.text,
                  syllabus: _syllabusController.text,
                );
                _courseStore.saveCourse(newCourse)
                    .then((value) => Modular.to.pushReplacementNamed(AppRoutes.course));
              },
              child: const Text('Create Course'),
            ),
          ],
        ));
  }
}
