class Student {
  final String id;
  final String fname;
  final String lname;

  Student._(this.id, this.fname, this.lname);

  factory Student.fromJson(Map json) {
    final id = json[''].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final fname = json['fname'];
    final lname = json['lname'];

    return Student._(id, fname, lname);
  }
}
