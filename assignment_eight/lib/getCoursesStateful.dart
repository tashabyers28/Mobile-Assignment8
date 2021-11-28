// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors, annotate_overrides, prefer_final_fields, avoid_print
//import 'dart:html';

import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'getStudents.dart';

class GetCourses extends StatefulWidget {
  final String id, courseName, courseInstructor, courseCredits;

  final CourseStudentApi api = CourseStudentApi();

  GetCourses(
      this.id, this.courseName, this.courseInstructor, this.courseCredits);

  @override
  _GetCoursesState createState() =>
      _GetCoursesState(id, courseName, courseInstructor, courseCredits);
}

class _GetCoursesState extends State<GetCourses> {
  final String id, courseName, courseInstructor, courseCredits;

  _GetCoursesState(
      this.id, this.courseName, this.courseInstructor, this.courseCredits);

  List students = [];
  List courses = [];
  bool _dbLoaded = false;

  //Create functions here
  void initState() {
    super.initState();

    widget.api.getCourses().then((data) {
      setState(() {
        courses = data;
        _dbLoaded = true;

        //data.sort((a, b) => a.courseName.compareTo(b.courseName));
      });
    });
  }

  void _deleteCourse(courseName) {
    setState(() {
      widget.api.deleteCourse(courseName);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
