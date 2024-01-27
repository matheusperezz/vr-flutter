import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/screens/course_screen.dart';
import 'package:vr_application/course/screens/create_course.dart';

import '../course/screens/course_page_screen.dart';
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
    r.child(AppRoutes.coursePage, child: (_) => CoursePageScreen(courseId: r.args.params['id'] as String));
    r.child(AppRoutes.createCoursePage, child: (context) => const CreateCourse());
    super.routes(r);
  }
}
