// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentStore on _StudentStoreBase, Store {
  late final _$studentsAtom =
      Atom(name: '_StudentStoreBase.students', context: context);

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

  late final _$coursesAtom =
      Atom(name: '_StudentStoreBase.courses', context: context);

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

  late final _$fetchStudentsAsyncAction =
      AsyncAction('_StudentStoreBase.fetchStudents', context: context);

  @override
  Future<void> fetchStudents() {
    return _$fetchStudentsAsyncAction.run(() => super.fetchStudents());
  }

  late final _$saveStudentAsyncAction =
      AsyncAction('_StudentStoreBase.saveStudent', context: context);

  @override
  Future<void> saveStudent(StudentDto student) {
    return _$saveStudentAsyncAction.run(() => super.saveStudent(student));
  }

  late final _$updateStudentAsyncAction =
      AsyncAction('_StudentStoreBase.updateStudent', context: context);

  @override
  Future<void> updateStudent(Student student) {
    return _$updateStudentAsyncAction.run(() => super.updateStudent(student));
  }

  late final _$fetchStudentByIdAsyncAction =
      AsyncAction('_StudentStoreBase.fetchStudentById', context: context);

  @override
  Future<Student> fetchStudentById(String id) {
    return _$fetchStudentByIdAsyncAction.run(() => super.fetchStudentById(id));
  }

  late final _$deleteStudentAsyncAction =
      AsyncAction('_StudentStoreBase.deleteStudent', context: context);

  @override
  Future<void> deleteStudent(String id) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(id));
  }

  late final _$fetchCoursesAsyncAction =
      AsyncAction('_StudentStoreBase.fetchCourses', context: context);

  @override
  Future<void> fetchCourses() {
    return _$fetchCoursesAsyncAction.run(() => super.fetchCourses());
  }

  @override
  String toString() {
    return '''
students: ${students},
courses: ${courses}
    ''';
  }
}
