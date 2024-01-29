class Endpoints {
  static const String baseUrl = 'http://localhost:8080';
  static const String courses = '/courses/';
  static const String students = '/students/';
  static const String courseStudent = '/class/';

  static String getCourseEndPoint(){
    return '$baseUrl$courses';
  }

  static String getStudentEndPoint(){
    return '$baseUrl$students';
  }

  static String getCourseStudentEndPoint(){
    return '$baseUrl$courseStudent';
  }
}