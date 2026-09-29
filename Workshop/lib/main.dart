import 'package:flutter/material.dart';
import 'screens/hello_world.dart';
import 'screens/snackbar.dart';
import 'screens/textfield.dart';
import 'screens/form_controls.dart';
import 'screens/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: const DrawerPage(),
      
    );
  }
}