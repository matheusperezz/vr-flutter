import 'package:flutter/material.dart';
import 'package:vr_application/_core/models/student.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/student/store/student_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateStudentScreen extends StatefulWidget {
  const CreateStudentScreen({super.key});

  @override
  State<CreateStudentScreen> createState() => _CreateStudentScreenState();
}

class _CreateStudentScreenState extends State<CreateStudentScreen> {
  final StudentStore _studentStore = StudentStore();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Cadastrando um estudante',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final StudentDto newStudent = StudentDto(
                  name: _nameController.text,
                );
                _studentStore
                    .saveStudent(newStudent)
                    .then((value) => Modular.to.pushReplacementNamed(AppRoutes.student));
              },
              child: const Text('Criar estudante'),
            ),
          ],
        ));
  }
}
