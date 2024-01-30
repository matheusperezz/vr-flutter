import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/student/screens/create_student_screen.dart';
import 'package:vr_application/student/screens/student_page_screen.dart';
import 'package:vr_application/student/screens/student_screen.dart';

class StudentModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.student, child: (context) => const StudentScreen());
    r.child(AppRoutes.createStudent,
        child: (context) => const CreateStudentScreen());
    r.child(AppRoutes.studentPage,
        child: (context) =>
            StudentPageScreen(studentId: r.args.params['id'] as String));

    super.routes(r);
  }
}
