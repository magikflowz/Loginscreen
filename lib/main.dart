import 'package:login/Screens/LoginPage.dart';
import 'package:login/Screens/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
  // await  configLoading();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // routes defined which page we can go on click this is optional
        '/signup': (BuildContext context) => new SignupPage(),
        '/login': (BuildContext context) => new MyHomePage(),
      },
      home:
          // TabScreen(),

          MyHomePage(),
    );
  }
}
