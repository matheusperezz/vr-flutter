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

  @observable
  List<Student> students = ObservableList<Student>();

  @observable
  List<Student> studentsAvailable = ObservableList<Student>();

  @action
  Future<void> fetchCourses() async {
    final List<Course> fetchedCourses = await _courseService.fetchCourses();
    courses.clear();
    courses.addAll(fetchedCourses);
  }

  @action
  Future<void> updateCourse(Course course) async {
    await _courseService.updateCourse(course);
    fetchCourses();
  }

  @action
  Future<Course> fetchCourseById(String id) async {
    Course fetchedCourse = await _courseService.fetchCourseById(id);
    return fetchedCourse;
  }

  @action
  Future<void> addStudent(String courseId, Student student) async {
    _courseService.addStudentToCourse(courseId, student);
    fetchStudents(courseId);
  }

  @action
  Future<void> saveCourse(CreateCourseDTO course) async {
    await _courseService.saveCourse(course);
    fetchCourses();
  }

  @action
  Future<void> fetchStudents(String courseId) async {
    final List<Student> fetchedStudents = await _courseService.fetchStudentsFromApi(courseId);
    students.clear();
    students.addAll(fetchedStudents);
  }

  @action
  Future<void> fetchAvailableStudents() async {
    final List<Student> fetchedStudents = await _courseService.fetchAvailableStudentsFromApi();
    studentsAvailable.clear();
    studentsAvailable.addAll(fetchedStudents);
  }

  @action
  Future<void> removeStudent(String courseId, Student student) async {
    _courseService.removeStudentFromCourse(courseId, student);
    fetchStudents(courseId);
  }
}