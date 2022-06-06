class Student {
  int? id;
  String firstName;
  String lastName;
  String imageUrl;
  int grade;

  Student(this.firstName, this.lastName, this.imageUrl, this.grade);

  Student.withId(this.id, this.firstName, this.lastName,this.imageUrl, this.grade);

  String get getStatus{
    String status = "";
    if (grade >= 50){
      status = "Geçti.";
    }
    else if (grade > 40){
      status = "Bütünlemeye kaldı.";
    }
    else{
      status = "Kaldı.";
    }
    return status;
  }
}
