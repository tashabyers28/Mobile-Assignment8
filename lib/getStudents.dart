// ignore_for_file: file_names, non_constant_identifier_names, use_key_in_widget_constructors, no_logic_in_create_state, prefer_const_constructors
//import 'dart:html';

import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'getCourses.dart';

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

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Student: " + widget.fname + " " + widget.lname,
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
                    "Enter a new name for " + widget.fname,
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
                      child: Text("Change First Name")),
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
