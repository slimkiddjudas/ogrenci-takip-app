import 'package:flutter/material.dart';
import '../models/Student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Yeni Öğrenci Ekle"),
        ),
        body: buildBody());
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
        ));
  }

  buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrenci adı", hintText: "Umut"),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Öğrenci soyadı", hintText: "Çerkezoğlu"),
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  buildImageField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Fotoğraf linki", hintText: "bilmemne.jpeg"),
      onSaved: (String? value) {
        student.imageUrl = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Öğrencinin notu", hintText: "80"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet."),
      onPressed: () {
        setState(() {
          formKey.currentState?.save();
          widget.students.add(student);
          Navigator.pop(context);
        });
      },
    );
  }
}
