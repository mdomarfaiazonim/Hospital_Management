import 'package:flutter/material.dart';
import 'package:vital_aid_on_flutter/HomePage.dart';
import 'package:vital_aid_on_flutter/SplashScreen.dart';
import 'About_Us_Page.dart';
import 'Call_Ambulance.dart';
import 'DoctorDetails.dart';
import 'Doctors.dart';
import 'Hospitals.dart';
import 'Login_Page.dart';
import 'Medical_Store_Page.dart';
import 'MyHomePage.dart';
import 'Profile_Page.dart';
import 'Search_Bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vital Aid',
        initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/login': (context) => LoginPage(),
        '/aboutus': (context) => About_Us(),
        '/callambulance': (context) => Call_Ambulance(),
        '/doctor': (context) => DoctorDetails(),
        '/hospitals': (context) => Hospitals(),
        '/doctorlist': (context) => Doctors(),
        '/medstore': (context) => Medical_Store(),
        '/myhomepage': (context) => MyHomePage(),
        '/searchbar': (context) => Searchbar()
      },
    );
  }
}
