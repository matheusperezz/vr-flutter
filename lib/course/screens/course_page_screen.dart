import 'package:flutter/material.dart';
import 'package:vr_application/_core/models/course.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/store/course_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoursePageScreen extends StatefulWidget {
  const CoursePageScreen({required this.courseId, super.key});

  final String courseId;

  @override
  State<CoursePageScreen> createState() => _CoursePageScreenState();
}

class _CoursePageScreenState extends State<CoursePageScreen> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _syllabusController = TextEditingController();
  final CourseStore _courseStore = CourseStore();
  late Future<Course> _courseFuture;

  @override
  void initState() {
    super.initState();
    _courseFuture = _courseStore.fetchCourseById(widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Course>(
        future: _courseFuture,
        builder: (BuildContext context, AsyncSnapshot<Course> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            _descriptionController.text = snapshot.data!.description;
            _syllabusController.text = snapshot.data!.syllabus;
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data!.description),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                    ElevatedButton(
                      onPressed: () {
                        // _courseStore.updateCourse(Course(
                        //     id: snapshot.data!.id.toInt(),
                        //     description: _descriptionController.text,
                        //     syllabus: _syllabusController.text,
                        //     students: snapshot.data!.students));
                        Modular.to.navigate(AppRoutes.course);
                      },
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
