import 'package:app_socios/WelcomeScreen.dart';
import 'package:app_socios/src/view/inside/Home/loginScreen.dart';
import 'package:app_socios/src/view/inside/Home/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kDefaultColor = Colors.deepPurple;

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ('inter'),
        useMaterial3: true,
      ),
      home: const /*loginScreen LoginPage*/ screenlogin(),
    );
  }
}