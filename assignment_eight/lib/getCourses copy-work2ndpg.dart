// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors, annotate_overrides, prefer_final_fields
//import 'dart:html';

import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';

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

  void _editStudentFname(id, fname) {
    setState(() {
      widget.api.editStudentFname(id, fname);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.courseName,
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
                  Text(
                    "Enter a new name for fname",
                    //widget.fname,
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            _editStudentFname(widget.id, nameController.text),
                          },
                      child: Text("Change Name")),
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
