import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

const Color darkBlue = Color.fromARGB(255, 16, 30, 44);

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
