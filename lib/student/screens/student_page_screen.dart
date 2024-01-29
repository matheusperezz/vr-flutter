import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../_core/models/student.dart';
import '../../_core/routes_names.dart';
import '../store/student_store.dart';

class StudentPageScreen extends StatelessWidget {
  const StudentPageScreen({required this.studentId, super.key});

  final String studentId;

  @override
  Widget build(BuildContext context) {
    final studentStore = StudentStore();
    final studentFuture = studentStore.fetchStudentById(studentId);
    studentStore.fetchCourses();

    return FutureBuilder(
        future: studentFuture,
        builder: (BuildContext context, AsyncSnapshot<Student> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final student = snapshot.data!;
            return StudentDetails(student: student, studentStore: studentStore);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class StudentDetails extends StatefulWidget {
  const StudentDetails({required this.student, required this.studentStore, Key? key}) : super(key: key);

  final Student student;
  final StudentStore studentStore;

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name)
      ..addListener(() {
        widget.student.name = _nameController.text;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student.name),
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
            _buildNameField(),
            const SizedBox(height: 18),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  TextField _buildNameField() {
    return TextField(
      controller: _nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Nome',
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.studentStore.updateStudent(widget.student).then(
                    (value) => Modular.to.navigate(
                    '${AppRoutes.student}/${widget.student.id}'));
          },
          child: const Text('Atualizar estudante'),
        ),
        ElevatedButton(
          onPressed: () {
            _showDeleteDialog(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Deletar estudante'),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
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
                widget.studentStore
                    .deleteStudent(widget.student.id.toString())
                    .then((value) => Modular.to.pushReplacementNamed(AppRoutes.student));
              },
              child: const Text('Deletar'),
            ),
          ],
        );
      },
    );
  }
}