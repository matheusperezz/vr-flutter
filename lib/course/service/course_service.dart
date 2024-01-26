import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../_core/models/course.dart';

const String API_URL = 'http://localhost:8080/courses';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Course> courses = data.map((json) => Course.fromJson(json)).cast<Course>().toList();
      return courses;
    } else {
      throw Exception('Falha ao carregar os cursos');
    }
  }

  Future<Course> saveCourse(Course course) async {
    String jsonCourse = json.encode(course.toMap());
    http.Response response = await http.post(
        Uri.parse(API_URL),
        body: jsonCourse,
        headers: {'Content-Type': 'application/json'}
    );

    return Course.fromJson(json.decode(response.body));
  }

  Future<Course> fetchCourseById(String id) async {
    final response = await http.get(Uri.parse('$API_URL/$id'));

    if (response.statusCode == 200) {
      return Course.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar o curso');
    }
  }
}
