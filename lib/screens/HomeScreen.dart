import 'package:flutter/material.dart';
import 'package:ogrenci_takip_app/screens/student_add.dart';
import 'package:ogrenci_takip_app/screens/student_update.dart';
import '../models/Student.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(
        1,
        "Umut",
        "Çerkezoğlu",
        "https://yazilimmuhendisligi.samsun.edu.tr/wp-content/uploads/sites/41/2019/07/zcomert.jpg",
        80),
    Student.withId(
        2,
        "Osman",
        "Gültekin",
        "https://mf.samsun.edu.tr/wp-content/uploads/sites/14/2019/05/ns.jpeg",
        45),
    Student.withId(
        3,
        "Zeynel",
        "Delibınar",
        "https://tarih.samsun.edu.tr/wp-content/uploads/sites/34/2019/05/Do%C3%A7.-Dr.-%C3%96zg%C3%BCr-YILMAZ-254x300.jpg",
        20)
  ];
  Student selectedStudent = Student.withId(0, "Hiç kimse", "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            title: const Text("öğrenci takip zart zurt",
                style: TextStyle(
                    color: Color.fromARGB(150, 3, 151, 255),
                    fontSize: 22,
                    fontStyle: FontStyle.italic))),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    students[index].firstName + " " + students[index].lastName,
                  ),
                  subtitle: Text("Sınavdan aldığı not: " +
                      students[index].grade.toString() +
                      " => " +
                      students[index].getStatus),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(students[index].imageUrl),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),
        Text("Seçili öğrenci: " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentAdd(students)),
                  ).then((value) => setState(() {})),
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 5.0),
                      Text("Yeni Öğrenci")
                    ],
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentUpdate(students, selectedStudent)),
                  ).then((value) => setState(() {})),
                  child: Row(
                    children: const [
                      Icon(Icons.update),
                      SizedBox(width: 5.0),
                      Text("Güncelle")
                    ],
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  onPressed: () {
                    print("Sil");
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.delete),
                      SizedBox(width: 5.0),
                      Text("Sil")
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade > 40) {
      return const Icon(Icons.donut_large);
    } else {
      return const Icon(Icons.accessible_forward_outlined);
    }
  }
}
