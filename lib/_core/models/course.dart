import 'package:vr_application/_core/models/student.dart';

class Course {
  final int id;
  final String description;
  final String syllabus;

  Course({
    required this.id,
    required this.description,
    required this.syllabus,
  });

  static Course fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['ID'],
      description: json['description'],
      syllabus: json['syllabus'],
    );
  }
}

class CourseSpecific {
  final int id;
  final String description;
  final String syllabus;
  final List<Student> students;

  CourseSpecific({
    required this.id,
    required this.description,
    required this.syllabus,
    required this.students,
  });

  static CourseSpecific fromJson(Map<String, dynamic> json) {
    return CourseSpecific(
      id: json['ID'],
      description: json['description'],
      syllabus: json['syllabus'],
      students: json['Students'].map((json) => Student.fromJson(json)).toList(),
    );
  }
}