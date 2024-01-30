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

  static String getCourseByIdEndpoint(String id){
    return '$baseUrl$courses$id';
  }

  static String getStudentsByCourseIdEndpoint(String courseId){
    return '$baseUrl$courses$courseId$students';
  }

  static String getCoursesFromAStudentEndpoint(String studentId){
    return '$baseUrl$students$studentId$courses';
  }
}