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

  late final _$fetchStudentsAsyncAction =
      AsyncAction('_StudentStoreBase.fetchStudents', context: context);

  @override
  Future<void> fetchStudents() {
    return _$fetchStudentsAsyncAction.run(() => super.fetchStudents());
  }

  @override
  String toString() {
    return '''
students: ${students}
    ''';
  }
}
