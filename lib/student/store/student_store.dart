import 'package:mobx/mobx.dart';
import 'package:vr_application/_core/models/student.dart';
import 'package:vr_application/student/services/student_service.dart';

import '../../_core/models/course.dart';

part 'student_store.g.dart';
// flutter pub run build_runner build
class StudentStore = _StudentStoreBase with _$StudentStore;

abstract class _StudentStoreBase with Store {
  final StudentService _studentService = StudentService();

  @observable
  List<Student> students = ObservableList<Student>();

  @observable
  List<Course> courses = ObservableList<Course>();

  @action
  Future<void> fetchStudents() async {
    final List<Student> fetchedStudents = await _studentService.fetchStudents();
    students.clear();
    students.addAll(fetchedStudents);
  }

  @action
  Future<void> saveStudent(StudentDto student) async {
    await _studentService.saveStudent(student);
    fetchStudents();
  }

  @action
  Future<void> updateStudent(Student student) async {
    await _studentService.updateStudent(student);
    fetchStudents();
  }

  @action
  Future<Student> fetchStudentById(String id) async {
    Student fetchedStudent = await _studentService.fetchStudentById(id);
    return fetchedStudent;
  }

  @action
  Future<void> deleteStudent(String id) async {
    await _studentService.deleteStudent(id);
    fetchStudents();
  }

  @action
  Future<void> fetchCourses() async {
    final List<Course> fetchedCourses = await _studentService.fetchAvailableCoursesFromApi();
    courses.clear();
    courses.addAll(fetchedCourses);
  }

}