// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors, avoid_print

//import 'package:assignment_eight/models/courses.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'getCourses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Courses and Students App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CourseStudentApi api = CourseStudentApi();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Set Variables here
  List courses = [];
  bool _dbLoaded = false;
  //var courses = <Course>[];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses and Students App"),
      ),
      body: Center(
          child: _dbLoaded
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        "Name    |    Instructor    |    Credits",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(5.0),
                          children: [
                            ...courses
                                .map<Widget>(
                                  (course) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: TextButton(
                                      onPressed: () => {
                                        //print(courses),
                                        Navigator.pop(context),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  //    MySecondPage()
                                                  //const SecondRoute() //Test
                                                  GetCourses(
                                                course['_id'],
                                                course['courseName'],
                                                course['courseInstructor'],
                                                course['courseCredits']
                                                    .toString(),
                                              ),
                                            )),
                                      },
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.school_outlined,
                                          color: Colors.black,
                                          size: 30.0,
                                        ),
                                        title: Text(
                                          (course['courseName'] +
                                                  " | " +
                                                  course['courseInstructor'] +
                                                  " | " +
                                                  course['courseCredits']
                                                      .toString()) +
                                              " credits",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ]),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Database Loading",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    CircularProgressIndicator()
                  ],
                )),
    );
  }
}
