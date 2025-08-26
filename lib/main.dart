import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academic Portal',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 32, 42, 68),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 32, 42, 68),
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const MyApp());
}

// import 'package:flutter/material.dart';
// import 'screens/evaluation_form.dart';
// import 'screens/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Faculty Evaluation System',
//       theme: ThemeData(
//         primaryColor: const Color.fromARGB(255, 32, 42, 68),
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color.fromARGB(255, 32, 42, 68),
//         ),
//         useMaterial3: true,
//       ),
//       home: const LoginScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }