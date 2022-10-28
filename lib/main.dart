import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loja_virtual/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter's Clothing",
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 4, 125, 141)),
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
      home: HomeScreen(),
    );
  }
}
