import 'package:mobx/mobx.dart';

import '../../_core/models/course.dart';
import '../../_core/models/student.dart';
import '../service/course_service.dart';

part 'course_store.g.dart';
// flutter pub run build_runner build
class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {
  final CourseService _courseService = CourseService();

  @observable
  List<Course> courses = ObservableList<Course>();

  @action
  Future<void> fetchCourses() async {
    final List<Course> fetchedCourses = await _courseService.fetchCourses();
    courses.clear();
    courses.addAll(fetchedCourses);
  }

  @action
  Future<void> updateCourse(Course course) async {
    await _courseService.saveCourse(course);
    fetchCourses();
  }

  @action
  Future<Course> fetchCourseById(String id) async {
    Course fetchedCourse = await _courseService.fetchCourseById(id);
    return fetchedCourse;
  }

  @action
  void addStudent(String courseId, Student student) {
    final courseIndex = courses.indexWhere((course) => course.id == courseId);
    if (courseIndex != -1) {
      courses[courseIndex].students.add(student);
    }
  }
}