import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Models/Doctor.dart';
import 'DoctorDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Doctors extends StatefulWidget {

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {

  String? name, speciality, location, hospital,consultationTime;

  bool isSwitched = false;
  void toggleFilterButton(){
    setState(() {
      isSwitched = !isSwitched;
    }
    );
  }
  @override
  Widget build(BuildContext context) {

    bool isSwitched = false;

    void toggleFilterButton(){
      setState(() {
        isSwitched = !isSwitched;
      });
    }



    Future<List<Doctor>> fetchDoctors() async {
      List<Doctor> doctors = [];
      final queryParams = {
        'speciality': speciality!=null? speciality.toString(): '',
        'location': location!=null? location.toString(): '',
        'consultationTime': consultationTime!=null? consultationTime.toString(): '',
        'hospital': hospital!=null? hospital.toString(): '',
        'name': name!=null? name.toString(): '',
      };
      final uri = Uri.http('localhost:8080', '/doctor/filter', queryParams);

      final response = await http.get(uri);

      doctors.clear();
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        for (var e in jsonData) {
          if(e['name'] != null && e['speciality'] != null && e['location'] != null && e['hospital'] != null && e['consultationTime'] != null) {
            Doctor doctor = Doctor(
                name: e['name'], speciality: e['speciality'], location: e['location'], hospital: e['hospital'], consultationTime: e['consultationTime']
            );
            doctors.add(doctor);
          }
        }
        return doctors;
      } else {
        throw Exception('Failed to load users');
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Meet With OurBest Doctors of vital-aid',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 30),)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 3000,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                  left: 0,
                  child: Container(
                    height: 3000,
                    width: 1540,
                    child: Image.network(
                      "https://t3.ftcdn.net/jpg/08/00/31/78/360_F_800317875_m6aNdK2Ymb0cEO9tGnhynjUfGi9Da1op.jpg",
                      fit: BoxFit.cover,
                    ),
                  )
              ),


              Positioned(
                top: 20,
                  left: 20,
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade300
                          )
                        ),
                        child: TextButton(
                          onPressed: (){
                            setState(() {
                              fetchDoctors();
                              toggleFilterButton();
                            });
                          },
                          child: Row(
                            children: [
                              ShowText('Filters'),
                              Icon(Icons.filter_alt_outlined),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      ShowListItems("Location",["All","Chittagong","Dhaka","Sylhet","Gazipur","Barisal","Rajshahi","Khulna","Comilla","Mymensingh","Rangpur"]),
                      SizedBox(width: 20),
                      ShowListItems("Field",["All","Pulmonology","Psychiatry","Oncology","Gynecology","ENT","Endocrinology","Cardiology","Orthopedics","Rheumatology","Dermatology","Neurology","Ophthalmology","Pediatrics","Nephrology"]),
                      SizedBox(width: 20),
                      ShowListItems("Hospitals",["All","Mymensingh Medical College","Mount Adora Hospital","United Hospital","Rangpur Medical College","Comilla Medical College","Rajshahi Medical College","Sher-e-Bangla Medical College","Khulna Medical College","Tairunnessa Memorial Medical College","Sylhet MAG Osmani Medical College","Apollo Hospital","Bangabandhu Sheikh Mujib Medical University","Max Hospital","Square Hospital","Gazi Medical College"]),
                      SizedBox(width: 20),
                      ShowListItems("consultationTime",["All","Sat","Sun","Mon","Tue","Wed","Thu","Fri"]),
                    ],
                  )
              ),

              Positioned(
                top: 100,
                left: 100,
                child: Container(
                  height: 800,
                  width: 1200,
                  child: FutureBuilder(
                      future: fetchDoctors(),
                      builder: (context,AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.white.withOpacity(0.5),
                                child: Container(
                                  height: 200,
                                  width: 1000,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          ShowText('Name: ${snapshot.data[index].name}'),
                                          SizedBox(width: 20),
                                          ShowText('Speciality: ${snapshot.data[index].speciality}'),
                                          SizedBox(width: 20),
                                          ShowText('Location: ${snapshot.data[index].location}'),
                                          SizedBox(width: 20),
                                          ShowText('Hospital: ${snapshot.data[index].hospital}'),
                                          SizedBox(width: 20),
                                          ShowText('Consultation Time: ${snapshot.data[index].consultationTime}'),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(width: 20),
                                          Material(
                                            elevation: 4,
                                            shadowColor: Colors.black,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            color: Colors.blue[800],
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.pushNamed(context, '/doctorDetails');
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                                child: Text('Book Appointment',style: TextStyle(color: Colors.white,fontSize: 20)),
                                              ),
                                              hoverColor: Colors.deepPurple[900],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        else{
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  ShowListItems(String s, List<String> list) {
    return DropdownMenu(
      initialSelection: "All",
      // enableFilter: true,
      label: Text(s=="consultationTime"?"Days":s),
      onSelected: (String? value){
        setState(() {
          if(s=="Location"){
            location = value=="All"?"":value;
          }
          else if(s=="Field"){
            speciality = value=="All"?"":value;
          }
          else if(s=="Hospitals"){
            hospital = value=="All"?"":value;
          }
          else if(s=="consultationTime"){
            consultationTime = value=="All"?"":value;
          }
        });
      },
      dropdownMenuEntries: <DropdownMenuEntry<String>>[
        for (String item in list)
          DropdownMenuEntry(value: item, label: item),
      ],
    );
  }

  ShowText(String s) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(s,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontStyle: FontStyle.italic),),
    );
  }
}


