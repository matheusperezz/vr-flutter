import 'package:mobx/mobx.dart';
import 'package:vr_application/_core/models/student.dart';
import 'package:vr_application/student/services/student_service.dart';

part 'student_store.g.dart';
// flutter pub run build_runner build
class StudentStore = _StudentStoreBase with _$StudentStore;

abstract class _StudentStoreBase with Store {
  final StudentService _courseService = StudentService();

  @observable
  List<Student> students = ObservableList<Student>();

  @action
  Future<void> fetchStudents() async {
    final List<Student> fetchedStudents = await _courseService.fetchStudents();
    students.clear();
    students.addAll(fetchedStudents);
  }
}