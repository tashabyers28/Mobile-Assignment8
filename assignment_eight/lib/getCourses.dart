// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors, annotate_overrides, prefer_final_fields
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

  void _deleteCourse(courseName) {
    setState(() {
      widget.api.deleteCourse(courseName);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  void _editStudentFname(id, fname) {
    setState(() {
      widget.api.editStudentFname(id, fname);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  List students = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getStudents().then((data) {
      setState(() {
        students = data;
        _dbLoaded = true;

        //data.sort((a, b) => a.courseName.compareTo(b.courseName));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseName + " Students",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => {
                            print(students),
                          },
                      child: Text("Print Students in Console")),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () => {
                Navigator.pop(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage())),
              }),
    );
  }
}
