import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../_core/models/student.dart';
import '../../_core/routes_names.dart';
import '../store/student_store.dart';

class StudentPageScreen extends StatefulWidget {
  const StudentPageScreen({required this.studentId, super.key});

  final String studentId;

  @override
  State<StudentPageScreen> createState() => _StudentPageScreenState();
}

class _StudentPageScreenState extends State<StudentPageScreen> {
  TextEditingController _nameController = TextEditingController();
  final StudentStore _studentStore = StudentStore();
  late Future<Student> _studentFuture;
  late Student _student;

  @override
  void initState() {
    super.initState();
    _studentFuture = _studentStore.fetchStudentById(widget.studentId);
    _studentStore.fetchCourses().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _studentFuture,
        builder: (BuildContext context, AsyncSnapshot<Student> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            _student = snapshot.data!;
            _nameController.text = _student.name;
            _nameController.addListener(() {
              _student.name = _nameController.text;
            });
            return Scaffold(
              appBar: AppBar(
                title: Text(_student.name),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Modular.to.navigate(AppRoutes.student);
                  },
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _studentStore.updateStudent(_student).then(
                                (value) => Modular.to.navigate(
                                    '${AppRoutes.student}/${widget.studentId}'));
                          },
                          child: const Text('Atualizar estudante'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Make an alert dialog to delete the student
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Deletar estudante'),
                                  content: const Text(
                                      'Tem certeza que deseja deletar o estudante?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Modular.to.pop();
                                      },
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _studentStore
                                            .deleteStudent(_student.id.toString())
                                            .then((value) => Modular.to.pushReplacementNamed(AppRoutes.student));
                                      },
                                      child: const Text('Deletar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Deletar estudante'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
