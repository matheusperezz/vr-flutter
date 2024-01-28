import 'package:flutter/material.dart';
import 'package:vr_application/student/widgets/students_lists.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../_core/routes_names.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: StudentListWidget(),
        ),
        // make a floating action button that have a text aside of a add icon
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Modular.to.navigate(AppRoutes.createStudent);
          },
          label: const Text('Adicionar'),
          icon: const Icon(Icons.add),
        )
    );
  }
}
