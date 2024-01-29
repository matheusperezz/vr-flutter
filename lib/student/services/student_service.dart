import 'package:http/http.dart' as http;
import 'package:vr_application/_core/models/student.dart';
import 'package:vr_application/_core/network/endpoints.dart';
import 'dart:convert';

import '../../_core/models/course.dart';

class StudentService {
  Future<List<Student>> fetchStudents() async {
    final response =
        await http.get(Uri.parse(Endpoints.baseUrl + Endpoints.students));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> students =
          data.map((json) => Student.fromJson(json)).cast<Student>().toList();
      return students;
    } else {
      throw Exception('Falha ao carregar os estudantes');
    }
  }

  Future<void> saveStudent(StudentDto student) async {
    String jsonStudent = json.encode(student.toMap());
    http.Response response = await http.post(
        Uri.parse(Endpoints.getStudentEndPoint()),
        body: jsonStudent,
        headers: {'Content-Type': 'application/json'});
    print('Student: $jsonStudent');
    if (response.statusCode != 201) {
      throw Exception('Falha ao salvar o estudante');
    }
  }

  Future<void> updateStudent(Student student) async {
    String jsonStudent = json.encode(student.toMap());
    http.put(Uri.parse('${Endpoints.getStudentEndPoint()}${student.id}'),
        body: jsonStudent, headers: {'Content-Type': 'application/json'});
  }

  Future<Student> fetchStudentById(String id) async {
    final response =
        await http.get(Uri.parse('${Endpoints.getStudentEndPoint()}$id'));

    if (response.statusCode == 200) {
      return Student.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar o estudante');
    }
  }

  Future<void> deleteStudent(String id) async {
    final response =
        await http.delete(Uri.parse('${Endpoints.getStudentEndPoint()}$id'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar o estudante');
    }
  }

  Future<List<Course>> fetchAvailableCoursesFromApi() async {
    final response = await http.get(Uri.parse(Endpoints.getCourseEndPoint()));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<Course> courses = responseData.map((data) => Course.fromJson(data)).toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }
}
