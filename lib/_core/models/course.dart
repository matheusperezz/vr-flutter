import 'package:vr_application/_core/models/student.dart';

class Course {
  int id;
  String description;
  String syllabus;
  List<Student> students;
  Course({
    required this.id,
    required this.description,
    required this.syllabus,
    required this.students,
  });

  static Course fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['ID'],
      description: json['description'],
      syllabus: json['syllabus'],
      students: json['students'] != null
          ? (json['students'] as List<dynamic>).map((json) => Student.fromJson(json as Map<String, dynamic>)).toList()
          : [],
    );
  }

  Object? toMap() {
    return {
      'ID': id,
      'description': description,
      'syllabus': syllabus,
      'students': students.map((student) => student.toMap()).toList(),
    };
  }
}

class CreateCourseDTO {
  String description;
  String syllabus;

  CreateCourseDTO({
    required this.description,
    required this.syllabus,
  });

  static CreateCourseDTO fromJson(Map<String, dynamic> json) {
    return CreateCourseDTO(
      description: json['description'],
      syllabus: json['syllabus'],
    );
  }

  Object? toMap() {
    return {
      'description': description,
      'syllabus': syllabus,
    };
  }
}