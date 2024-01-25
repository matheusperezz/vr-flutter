import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/course_screen.dart';

import '../home/home_screen.dart';
import '../student/student_screen.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.home, child: (contextx) => const HomeScreen());
    r.child(AppRoutes.course, child: (contextx) => const CourseScreen());
    r.child(AppRoutes.student, child: (contextx) => const StudentScreen());
    super.routes(r);
  }
}