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

  late final _$studentsAtom =
      Atom(name: '_CourseStoreBase.students', context: context);

  @override
  List<Student> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<Student> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$studentsAvailableAtom =
      Atom(name: '_CourseStoreBase.studentsAvailable', context: context);

  @override
  List<Student> get studentsAvailable {
    _$studentsAvailableAtom.reportRead();
    return super.studentsAvailable;
  }

  @override
  set studentsAvailable(List<Student> value) {
    _$studentsAvailableAtom.reportWrite(value, super.studentsAvailable, () {
      super.studentsAvailable = value;
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

  late final _$addStudentAsyncAction =
      AsyncAction('_CourseStoreBase.addStudent', context: context);

  @override
  Future<void> addStudent(String courseId, Student student) {
    return _$addStudentAsyncAction
        .run(() => super.addStudent(courseId, student));
  }

  late final _$saveCourseAsyncAction =
      AsyncAction('_CourseStoreBase.saveCourse', context: context);

  @override
  Future<void> saveCourse(CreateCourseDTO course) {
    return _$saveCourseAsyncAction.run(() => super.saveCourse(course));
  }

  late final _$fetchStudentsFromCourseAsyncAction =
      AsyncAction('_CourseStoreBase.fetchStudentsFromCourse', context: context);

  @override
  Future<List<Student>> fetchStudentsFromCourse(String courseId) {
    return _$fetchStudentsFromCourseAsyncAction
        .run(() => super.fetchStudentsFromCourse(courseId));
  }

  late final _$fetchAvailableStudentsAsyncAction =
      AsyncAction('_CourseStoreBase.fetchAvailableStudents', context: context);

  @override
  Future<List<Student>> fetchAvailableStudents() {
    return _$fetchAvailableStudentsAsyncAction
        .run(() => super.fetchAvailableStudents());
  }

  late final _$removeStudentAsyncAction =
      AsyncAction('_CourseStoreBase.removeStudent', context: context);

  @override
  Future<void> removeStudent(String courseId, Student student) {
    return _$removeStudentAsyncAction
        .run(() => super.removeStudent(courseId, student));
  }

  late final _$removeCourseAsyncAction =
      AsyncAction('_CourseStoreBase.removeCourse', context: context);

  @override
  Future<void> removeCourse(String id) {
    return _$removeCourseAsyncAction.run(() => super.removeCourse(id));
  }

  @override
  String toString() {
    return '''
courses: ${courses},
students: ${students},
studentsAvailable: ${studentsAvailable}
    ''';
  }
}
