import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:vr_application/_core/models/course.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/store/course_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  late Course _course;

  @override
  void initState() {
    super.initState();
    _courseFuture = _courseStore.fetchCourseById(widget.courseId);
    _courseStore.fetchAvailableStudents().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Course>(
      future: _courseFuture,
      builder: (BuildContext context, AsyncSnapshot<Course> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          _course = snapshot.data!;
          _descriptionController.text = _course.description;
          _syllabusController.text = _course.syllabus;
          _descriptionController.addListener(() {
            _course.description = _descriptionController.text;
          });
          _syllabusController.addListener(() {
            _course.syllabus = _syllabusController.text;
          });
          return Scaffold(
            appBar: AppBar(
              title: Text(_course.description),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Cancel operations and go back to courses page
                  Modular.to.pushReplacementNamed(AppRoutes.course);
                },
              ),
            ),
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
                  studentsInThisCourseList(),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pesquisar Alunos',
                    ),
                  ),
                  availableStudentList(),
                  const SizedBox(height: 20),
                  buildUpdateAndDeleteButtons()
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
      },
    );
  }

  Expanded studentsInThisCourseList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _course.students.length,
        itemBuilder: (context, index) {
          final student = _course.students[index];
          return ListTile(
              title: Text(student.name),
              onLongPress: () async {
                try {
                  // make an alert dialog
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Remover aluno'),
                        content: Text(
                          'Deseja remover o aluno ${student.name} do curso?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Modular.to.pop();
                              await _courseStore.removeStudent(
                                  widget.courseId, student);
                              List<Student> students = await _courseStore
                                  .fetchStudentsFromCourse(widget.courseId);
                              setState(() {
                                _course.students = students;
                              });
                            },
                            child: const Text('Remover'),
                          ),
                        ],
                      );
                    },
                  );
                } catch (e) {
                  // TODO: Make an toast with error message
                  print('Error: $e');
                }
              });
        },
      ),
    );
  }

  Expanded availableStudentList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _courseStore.studentsAvailable.length,
        itemBuilder: (context, index) {
          final student = _courseStore.studentsAvailable[index];
          return ListTile(
            title: Text(student.name),
            onTap: () async {
              try {
                await _courseStore.addStudent(widget.courseId, student);
                List<Student> students =
                    await _courseStore.fetchStudentsFromCourse(widget.courseId);
                setState(() {
                  _course.students = students;
                });
              } catch (e) {
                print('Error: $e');
              }
            },
          );
        },
      ),
    );
  }

  Row buildUpdateAndDeleteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            _courseStore.updateCourse(_course).then((_) {
              // Print all navigation stack
              Modular.to.navigate(AppRoutes.course);
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple,
            onPrimary: Colors.white,
          ),
          child: const Text('Atualizar curso'),
        ),
        const SizedBox(width: 18),
        ElevatedButton(
          onPressed: () {
            _courseStore.removeCourse(_course.id.toString()).then((_) {
              Modular.to.pop();
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          ),
          child: const Text('Deletar curso'),
        ),
      ],
    );
  }
}
