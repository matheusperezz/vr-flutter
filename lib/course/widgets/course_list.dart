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
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _courseStore.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Buscar curso',
              ),
            )),
        Expanded(
          child: Observer(
            builder: (BuildContext context) {
              if (_courseStore.courses.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final filteredCourses = _courseStore.courses.where((course) {
                if (_searchText.isEmpty) {
                  return true;
                }

                final searchTextWords = _searchText
                    .toLowerCase()
                    .replaceAll(new RegExp(r'[^\w\s]+'), '')
                    .split(' ');

                final courseDescriptionWords = course.description
                    .toLowerCase()
                    .replaceAll(new RegExp(r'[^\w\s]+'), '')
                    .split(' ');

                return searchTextWords.every((word) {
                  return courseDescriptionWords.any((courseWord) {
                    return courseWord.contains(word);
                  });
                });
              }).toList();

              if (filteredCourses.isEmpty) {
                return const Center(
                  child: Text('Nenhum registro foi encontrado'),
                );
              }

              return ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (BuildContext context, int index) {
                  final course = filteredCourses[index];
                  return ListTile(
                      title: Text(course.description),
                      subtitle: Text(course.syllabus),
                      trailing: course.students.length < 5
                          ? Text('turma não fechada')
                          : null,
                      onTap: () {
                        Modular.to.navigate('${AppRoutes.course}/${course.id}');
                      });
                },
              );
            },
          ),
        ),
      ],
    ));
  }
}
