import 'package:flutter/material.dart';

import 'About_Us_Page.dart';
import 'Call_Ambulance.dart';
import 'Doctors.dart';
import 'HomePage.dart';
import 'Hospitals.dart';
import 'Login_Page.dart';
import 'Medical_Store_Page.dart';
import 'Profile_Page.dart';
import 'Search_Bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages=[
    Home(),
    Profile(),
    LoginPage(),
    About_Us(),
    Call_Ambulance(),
    Doctors(),
    Hospitals(),
    Medical_Store(),
    Searchbar()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Color(0xffC9E6F0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call Ambulance'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Doctors'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Hospitals'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medical Store'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          )
        ],

      ),
    );
  }
}














