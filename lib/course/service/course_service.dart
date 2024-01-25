import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../_core/models/course.dart';

const String API_URL = 'http://localhost:8080/courses';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      print('Resposta finalizada ${response.body}');
      List<dynamic> data = json.decode(response.body);
      List<Course> courses = data.map((json) => Course.fromJson(json)).toList();
      return courses;
    } else {
      throw Exception('Falha ao carregar os cursos');
    }
  }
}