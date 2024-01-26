// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseStore on _CourseStoreBase, Store {
  late final _$coursesAtom =
      Atom(name: '_CourseStoreBase.courses', context: context);

  @override
  List<Course> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(List<Course> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  late final _$fetchCoursesAsyncAction =
      AsyncAction('_CourseStoreBase.fetchCourses', context: context);

  @override
  Future<void> fetchCourses() {
    return _$fetchCoursesAsyncAction.run(() => super.fetchCourses());
  }

  late final _$updateCourseAsyncAction =
      AsyncAction('_CourseStoreBase.updateCourse', context: context);

  @override
  Future<void> updateCourse(Course course) {
    return _$updateCourseAsyncAction.run(() => super.updateCourse(course));
  }

  late final _$fetchCourseByIdAsyncAction =
      AsyncAction('_CourseStoreBase.fetchCourseById', context: context);

  @override
  Future<Course> fetchCourseById(String id) {
    return _$fetchCourseByIdAsyncAction.run(() => super.fetchCourseById(id));
  }

  late final _$_CourseStoreBaseActionController =
      ActionController(name: '_CourseStoreBase', context: context);

  @override
  void addStudent(String courseId, Student student) {
    final _$actionInfo = _$_CourseStoreBaseActionController.startAction(
        name: '_CourseStoreBase.addStudent');
    try {
      return super.addStudent(courseId, student);
    } finally {
      _$_CourseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courses: ${courses}
    ''';
  }
}
