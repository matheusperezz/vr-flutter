import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_application/_core/routes_names.dart';
import 'package:vr_application/course/screens/course_page_screen.dart';
import 'package:vr_application/course/screens/course_screen.dart';
import 'package:vr_application/course/screens/create_course.dart';

class CourseModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.course, child: (context) => const CourseScreen());
    r.child(AppRoutes.coursePage,
        child: (context) =>
            CoursePageScreen(courseId: r.args.params['id'] as String));
    r.child(AppRoutes.createCoursePage,
        child: (context) => const CreateCourse());
    super.routes(r);
  }
}
