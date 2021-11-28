// ignore_for_file: unused_import, file_names

import 'package:dio/dio.dart';
import './models/courses.dart';
import './models/students.dart';

//const String localhost = "http://localhost:1200/";
const String localhost = "http://10.0.2.2:1200/";
//const String localhost = "http://127.0.0.1:1200/";
//const String localhost = "http://192.168.86.22:1200/";

class CourseStudentApi {
  final _dio = Dio(BaseOptions(baseUrl: localhost));

  Future<List> getCourses() async {
    final response = await _dio.get('/getCourses');

    return response.data['courses'];
  }

  Future<List> getStudents() async {
    final response = await _dio.get('/getStudents');

    return response.data['students'];
  }

  Future editStudentFname(String id, String fname) async {
    final response =
        await _dio.post('/editStudentFname', data: {'id': id, 'fname': fname});
    return response.data['students'];
  }

  Future deleteCourse(String courseName) async {
    final response =
        await _dio.post('/deleteCourse', data: {'courseName': courseName});
    return response.data['courses'];
  }
}
