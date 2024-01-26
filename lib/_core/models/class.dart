import 'package:vr_application/_core/models/student.dart';

class Class {
  final int studentCode;
  final int courseCode;

  Class({
    required this.studentCode,
    required this.courseCode,
  });

  static Class fromJson(Map<String, dynamic> json) {
    return Class(
      studentCode: json['student_code'],
      courseCode: json['student_code'],
    );
  }

  Object? toMap() {
    return {
      'student_code': studentCode,
      'course_code': courseCode,
    };
  }
}