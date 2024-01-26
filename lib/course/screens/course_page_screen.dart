import 'package:flutter/material.dart';
import 'package:vr_application/_core/models/course.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/store/course_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/course/widgets/student_list.dart';

import '../../_core/models/student.dart';

class CoursePageScreen extends StatefulWidget {
  const CoursePageScreen({required this.courseId, super.key});

  final String courseId;

  @override
  State<CoursePageScreen> createState() => _CoursePageScreenState();
}

class _CoursePageScreenState extends State<CoursePageScreen> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _syllabusController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  final CourseStore _courseStore = CourseStore();
  late Future<Course> _courseFuture;

  @override
  void initState() {
    super.initState();
    _courseFuture = _courseStore.fetchCourseById(widget.courseId);
    _courseStore.fetchAvailableStudents();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Course>(
        future: _courseFuture,
        builder: (BuildContext context, AsyncSnapshot<Course> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            for (var student in _courseStore.studentsAvailable) {
              print('student: ${student.name}');
            }
            _descriptionController.text = snapshot.data!.description;
            _syllabusController.text = snapshot.data!.syllabus;
            return Scaffold(
              appBar: AppBar(
                  title: Text(snapshot.data!.description),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Modular.to.navigate(AppRoutes.course);
                    },
                  )),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _syllabusController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Syllabus',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Alunos matriculados neste curso'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.students.length,
                        itemBuilder: (context, index) {
                          final student = snapshot.data!.students[index];
                          return ListTile(
                            title: Text(student.name),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {

                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Pesquisar Alunos',
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _courseStore.studentsAvailable.length,
                        itemBuilder: (context, index) {
                          final student = _courseStore.studentsAvailable[index];
                          return ListTile(
                            title: Text(student.name),
                            onTap: () {

                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {

                        Modular.to.navigate(AppRoutes.course);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        onPrimary: Colors.white,
                      ),
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
