import 'package:http/http.dart' as http;
import 'package:vr_application/_core/models/class.dart';
import 'package:vr_application/_core/models/student.dart';
import 'dart:convert';

import '../../_core/models/course.dart';

const String API_URL = 'http://localhost:8080/courses';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Course> courses =
          data.map((json) => Course.fromJson(json)).cast<Course>().toList();
      return courses;
    } else {
      throw Exception('Falha ao carregar os cursos');
    }
  }

  Future<Course> saveCourse(Course course) async {
    String jsonCourse = json.encode(course.toMap());
    http.Response response = await http.post(Uri.parse(API_URL),
        body: jsonCourse, headers: {'Content-Type': 'application/json'});

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

  Future<List<Student>> fetchStudentsFromApi(String courseId) async {
    final response = await http.get(Uri.parse('$API_URL/$courseId/students'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> students =
          data.map((json) => Student.fromJson(json)).cast<Student>().toList();
      return students;
    } else {
      throw Exception('Falha ao carregar os estudantes');
    }
  }

  Future<List<Student>> fetchAvailableStudentsFromApi() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> students =
          data.map((json) => Student.fromJson(json)).cast<Student>().toList();
      return students;
    } else {
      throw Exception('Falha ao carregar os estudantes');
    }
  }

  void addStudentToCourse(String courseId, Student student) async {
    int studentCode = student.id;
    int courseCode = int.parse(courseId);
    Class studentCourse =
        Class(studentCode: studentCode, courseCode: courseCode);
    String jsonStudent = json.encode(studentCourse.toMap());
    final response = await http.post(Uri.parse('http://localhost:8080/class/'),
        body: jsonStudent);
    if (response.statusCode != 200) {
      throw Exception('Falha ao adicionar o estudante ao curso');
    }
  }
}
