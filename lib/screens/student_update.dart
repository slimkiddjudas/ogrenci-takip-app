import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/Student.dart';

class StudentUpdate extends StatefulWidget {
  List<Student> students;
  Student selectedStudent;
  StudentUpdate(this.students, this.selectedStudent);

  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState();
  }
}

class _StudentUpdateState extends State<StudentUpdate> {
  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenci Güncelleme"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildFirstNameField(),
            buildLastNameField(),
            buildImageField(),
            buildGradeField(),
            buildSubmitButton()
          ],
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci adı", hintText: widget.selectedStudent.firstName),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci soyadı",
          hintText: widget.selectedStudent.lastName),
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  buildImageField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci resmi",
          hintText: widget.selectedStudent.imageUrl),
      onSaved: (String? value) {
        student.imageUrl = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci notu",
          hintText: widget.selectedStudent.grade.toString()),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: const Text("Güncelle"),
      onPressed: (){
        setState(() {
          formKey.currentState?.save();
          widget.students[findSelectedIndex(widget.students, widget.selectedStudent)] = student;
          Navigator.pop(context);
        });
      },
    );
  }

  int findSelectedIndex(List<Student>students, Student selectedStudent){
    for (int i=0; i<=students.length; i++){
      if (students[i].id == selectedStudent.id){
        return i;
      }
    }
    return 0;
  }
}
