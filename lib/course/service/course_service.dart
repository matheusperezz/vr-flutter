import 'package:http/http.dart' as http;
import 'package:vr_application/_core/models/class.dart';
import 'package:vr_application/_core/models/student.dart';
import 'package:vr_application/_core/network/endpoints.dart';
import 'dart:convert';

import '../../_core/models/course.dart';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(Endpoints.baseUrl + Endpoints.courses));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Course> courses =
          data.map((json) => Course.fromJson(json)).cast<Course>().toList();
      return courses;
    } else {
      throw Exception('Falha ao carregar os cursos');
    }
  }

  Future<void> saveCourse(CreateCourseDTO course) async {
    String jsonCourse = json.encode(course.toMap());
    http.Response response = await http.post(Uri.parse(Endpoints.getCourseEndPoint()),
        body: jsonCourse, headers: {'Content-Type': 'application/json'});
    print('Course: $jsonCourse');
    if (response.statusCode != 201) {
      throw Exception('Falha ao salvar o curso');
    }
  }

  Future<void> updateCourse(Course course) async {
    String jsonCourse = json.encode(course.toMap());
    http.put(Uri.parse('${Endpoints.getCourseEndPoint()}/${course.id}'),
        body: jsonCourse, headers: {'Content-Type': 'application/json'});
  }

  Future<Course> fetchCourseById(String id) async {
    final response = await http.get(Uri.parse('${Endpoints.getCourseEndPoint()}/$id'));

    if (response.statusCode == 200) {
      return Course.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar o curso');
    }
  }

  Future<List<Student>> fetchStudentsFromApi(String courseId) async {
    final response = await http.get(Uri.parse('${Endpoints.getCourseEndPoint()}/$courseId/students'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<Student> students = responseData.map((data) => Student.fromJson(data)).toList();
      for (var student in students){
        print('Resposta nome api: ${student.name}');
      }
      return students;
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<List<Student>> fetchAvailableStudentsFromApi() async {
    final response = await http.get(Uri.parse(Endpoints.getStudentEndPoint()));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> students = data.map((json) => Student.fromJson(json)).cast<Student>().toList();
      return students;
    } else {
      // Show the request error message in throw
      throw Exception('Falha ao carregar os estudantes');
    }
  }

  Future<void> addStudentToCourse(String courseId, Student student) async {
    int studentCode = student.id;
    int courseCode = int.parse(courseId);
    Class studentCourse =
        Class(studentCode: studentCode, courseCode: courseCode);
    String jsonStudent = json.encode(studentCourse.toMap());
    final response = await http.post(Uri.parse(Endpoints.getCourseStudentEndPoint()),
        body: jsonStudent);
    if (response.statusCode != 200) {
      // Show the response body
      print('Erro ao adicionar estudante no curso ?');
      throw Exception('Erro: ${response.body}');
    }
  }

  Future<void> removeStudentFromCourse(String courseId, Student student) async {
    final Class studentCourse = Class(
        studentCode: student.id, courseCode: int.parse(courseId));
    String jsonClass = json.encode(studentCourse.toMap());
    print('Class: $jsonClass');
    final response = await http.delete(
        Uri.parse(Endpoints.getCourseStudentEndPoint()), body: jsonClass);
    if (response.statusCode != 200) {
      throw Exception('Falha ao remover o estudante do curso');
    }
    fetchAvailableStudentsFromApi();
  }

  Future<void> removeCourse(String id) async {
    final response =
        await http.delete(Uri.parse('${Endpoints.getCourseEndPoint()}/$id'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar o curso');
    }
  }

  Future<int> fetchStudentsCourseCount(String courseId) async {
    final response = await http.get(Uri.parse('${Endpoints.getCourseEndPoint()}/$courseId/students'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> students = data.map((json) => Student.fromJson(json)).cast<Student>().toList();
      return students.length;
    } else {
      throw Exception('Falha ao carregar o número de estudantes do curso');
    }
  }
}
