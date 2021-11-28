// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors
//import 'dart:html';

import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';

class GetStudents extends StatefulWidget {
  final String id, fname, lname;

  final CourseStudentApi api = CourseStudentApi();

  GetStudents(this.id, this.fname, this.lname);

  @override
  _GetStudentsState createState() => _GetStudentsState(id, fname, lname);
}

class _GetStudentsState extends State<GetStudents> {
  final String id, fname, lname;

  _GetStudentsState(this.id, this.fname, this.lname);

  bool _dbLoaded = false;
  List students = [];

  //Create functions here
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

  void _editStudentFname(id, fname) {
    setState(() {
      widget.api.editStudentFname(id, fname);
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
