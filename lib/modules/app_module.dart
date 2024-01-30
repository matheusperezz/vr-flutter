import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/home/home_screen.dart';
import 'package:vr_application/modules/course_module.dart';
import 'package:vr_application/modules/home_module.dart';
import 'package:vr_application/modules/student_module.dart';

import '../course/screens/course_page_screen.dart';
import '../course/screens/course_screen.dart';
import '../course/screens/create_course.dart';
import '../student/screens/create_student_screen.dart';
import '../student/screens/student_page_screen.dart';
import '../student/screens/student_screen.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    // TODO: Error on routing with Modules [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: RouteNotFoundException: Route (/student/) not found
    r.child(AppRoutes.home, child: (contextx) => const HomeScreen());

    r.child(AppRoutes.student, child: (context) => const StudentScreen());
    r.child(AppRoutes.createStudent, child: (context) => const CreateStudentScreen());
    r.child(AppRoutes.studentPage, child: (context) => StudentPageScreen(studentId: r.args.params['id'] as String));

    r.child(AppRoutes.course, child: (context) => const CourseScreen());
    r.child(AppRoutes.coursePage, child: (context) => CoursePageScreen(courseId: r.args.params['id'] as String));
    r.child(AppRoutes.createCoursePage, child: (context) => const CreateCourse());

    super.routes(r);
  }
}
