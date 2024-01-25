import 'package:mobx/mobx.dart';

import '../../_core/models/course.dart';
import '../service/course_service.dart';

part 'course_store.g.dart';

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
}