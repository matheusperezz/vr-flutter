import 'package:vr_application/_core/models/student.dart';

class Course {
  final int id;
  final String description;
  final String syllabus;
  final List<Student> students;
  Course({
    required this.id,
    required this.description,
    required this.syllabus,
    required this.students,
  });

  static Course fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      description: json['description'],
      syllabus: json['syllabus'],
      students: (json['students'] as List<dynamic>).map((json) => Student.fromJson(json as Map<String, dynamic>)).toList(),
    );
  }

  Object? toMap() {
    return {
      'id': id,
      'description': description,
      'syllabus': syllabus,
      'students': students.map((student) => student.toMap()).toList(),
    };
  }
}