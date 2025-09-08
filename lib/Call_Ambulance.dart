import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Call_Ambulance extends StatefulWidget {
  @override
  State<Call_Ambulance> createState() => _Call_AmbulanceState();
}

class _Call_AmbulanceState extends State<Call_Ambulance> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();

  Future<bool> isLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> createUser(PatientCallsAmbulance patient) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/Patient_Calls_Ambulance/add'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(patient.toJson()),
      );
      print("Response: ${response.statusCode}");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC9E6F0),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 400,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Call an Ambulance 🚑",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Please enter your address and contact number below.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Address input
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: "Enter Location",
                          prefixIcon: const Icon(Icons.location_on, color: Colors.red),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? "Please enter your address" : null,
                      ),
                      const SizedBox(height: 16),

                      // Contact input
                      TextFormField(
                        controller: _contactController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Enter Your Contact Number",
                          prefixIcon: const Icon(Icons.call, color: Colors.green),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? "Please enter your contact number" : null,
                      ),
                      const SizedBox(height: 24),

                      // Register button
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (!await isLogged()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("⚠ Please login first!"),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                              return;
                            }

                            final patient = PatientCallsAmbulance(
                              address: _addressController.text,
                              contact: _contactController.text,
                            );

                            await createUser(patient);

                            _addressController.clear();
                            _contactController.clear();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("✅ Registered Successfully! Ambulance is on the way..."),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PatientCallsAmbulance {
  String address;
  String contact;

  PatientCallsAmbulance({required this.address, required this.contact});

  factory PatientCallsAmbulance.fromJson(Map<String, dynamic> json) {
    return PatientCallsAmbulance(
      address: json['address'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'contact': contact,
    };
  }
}
