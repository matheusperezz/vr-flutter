import 'course.dart';

class Student {
  final int id;
  final String name;
  final List<Course> courses;

  Student({
    required this.id,
    required this.name,
    required this.courses,
  });

  static Student fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      courses: (json['courses'] as List).map((json) => Course.fromJson(json)).toList(),
    );
  }

  Object? toMap() {
    return {
      'id': id,
      'name': name,
      'courses': courses.map((course) => course.toMap()).toList(),
    };
  }
}
