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
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _studentStore.fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        key: const Key('studentScreen'),
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
                labelText: 'Buscar aluno',
              ),
            ),
          ),
          ObservableStudentList(),
        ],
      ),
    );
  }

  Expanded ObservableStudentList() {
    return Expanded(
          child: Observer(
            builder: (BuildContext context) {
              if (_studentStore.students.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final filteredStudents = _studentStore.students.where((student) {
                if (_searchText.isEmpty) {
                  return true;
                }

                final searchTextWords = _searchText
                    .toLowerCase()
                    .replaceAll(new RegExp(r'[^\w\s]+'), '')
                    .split(' ');

                final studentNameWords = student.name
                    .toLowerCase()
                    .replaceAll(new RegExp(r'[^\w\s]+'), '')
                    .split(' ');

                return searchTextWords.every((word) {
                  return studentNameWords.any((studentWord) {
                    return studentWord.contains(word);
                  });
                });
              }).toList();

              if (filteredStudents.isEmpty) {
                return const Center(
                  child: Text('Nenhum registro foi encontrado'),
                );
              }

              return ListView.builder(
                itemCount: filteredStudents.length,
                itemBuilder: (BuildContext context, int index) {
                  final student = filteredStudents[index];
                  return ListTile(
                      title: Text(student.name),
                      subtitle: Text('Certamente um aluno'),
                      onTap: () {
                        Modular.to.navigate('${AppRoutes.student}/${student.id}');
                      });
                },
              );
            },
          ),
        );
  }
}
