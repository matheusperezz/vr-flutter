import 'course.dart';

class Student {
  int id;
  String name;
  List<Course> courses;

  Student({
    required this.id,
    required this.name,
    required this.courses,
  });

  static Student fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'],
      name: json['name'],
      courses: json['courses'] != null
          ? (json['courses'] as List<dynamic>)
              .map((json) => Course.fromJson(json as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  Object? toMap() {
    return {
      'ID': id,
      'name': name,
      'courses': courses.map((course) => course.toMap()).toList(),
    };
  }
}

class StudentDto {
  String name;

  StudentDto({
    required this.name,
  });

  Object? toMap() {
    return {
      'name': name,
    };
  }

  static StudentDto fromJson(Map<String, dynamic> json) {
    return StudentDto(
      name: json['name'],
    );
  }
}