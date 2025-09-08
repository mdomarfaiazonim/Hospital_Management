import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vital_aid_on_flutter/Models/Hospital.dart';

class Hospitals extends StatefulWidget {
  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  String? hospitalName;
  String? hospitalLocation;
  late Future<List<Hospital>> hospitalFuture;

  @override
  void initState() {
    super.initState();
    hospitalFuture = fetchHospitalList();
  }

  Future<List<Hospital>> fetchHospitalList() async {
    final queryParams = {
      'hospital_name': hospitalName ?? '',
      'hospital_location': hospitalLocation ?? '',
    };

    final uri = Uri.http('localhost:8080', '/hospital/filter', queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData as List)
          .map((e) => Hospital(
                hospital_name: e['hospital_name'] ?? '',
                hospital_location: e['hospital_location'] ?? '',
              ))
          .toList();
    } else {
      throw Exception('Failed to load hospitals');
    }
  }

  void _applyFilters() {
    setState(() {
      hospitalFuture = fetchHospitalList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospitals Nearby 🏥"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Filters
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.teal.shade100,
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildDropdown(
                  label: "Location",
                  items: const [
                    "All",
                    "Dhaka",
                    "Chattogram",
                    "Rajshahi",
                    "Sylhet",
                    "Barishal",
                    "Gazipur",
                    "Khulna",
                    "Rangpur",
                    "Cumilla",
                    "Dinajpur",
                    "Feni",
                    "Mymensingh",
                    "Bogura",
                    "Narayanganj",
                    "Chandpur",
                  ],
                  onChanged: (value) {
                    hospitalLocation = value == "All" ? "" : value;
                    _applyFilters();
                  },
                ),
                _buildDropdown(
                  label: "Hospital",
                  items: const [
                    "All",
                    "City Health Hospital",
                    "Chandpur General Hospital",
                    "Gazipur Medical College Hospital",
                    "Narayanganj General Hospital",
                    "Savar Upazila Health Complex",
                    "Bogura Medical College Hospital",
                    "Mymensingh Medical College Hospital",
                    "Feni General Hospital",
                    "Dinajpur Sadar Hospital",
                    "Jalalabad Medical College Hospital",
                    "Cumilla Medical College Hospital",
                    "Sir Salimullah Medical College & Mitford Hospital",
                    "Bangabandhu Sheikh Mujib Medical University",
                    "Barishal District Hospital",
                    "Rangpur Community Medical College Hospital",
                    "Khulna Medical College Hospital",
                    "Sylhet Shishu Hospital",
                    "Rajshahi Medical College Hospital",
                    "Apollo Chattogram Hospital",
                    "Dhaka Medical College Hospital",
                  ],
                  onChanged: (value) {
                    hospitalName = value == "All" ? "" : value;
                    _applyFilters();
                  },
                ),
              ],
            ),
          ),

          // Hospital List
          Expanded(
            child: FutureBuilder<List<Hospital>>(
              future: hospitalFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.teal));
                } else if (snapshot.hasError) {
                  return Center(child: Text("⚠ ${snapshot.error}"));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.separated(
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.teal),
                    itemBuilder: (context, index) {
                      final hospital = snapshot.data![index];
                      return ListTile(
                        leading: const Icon(Icons.local_hospital,
                            color: Colors.redAccent),
                        title: Text(
                          hospital.hospital_name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          hospital.hospital_location,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No hospitals found"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown Widget
  Widget _buildDropdown({
    required String label,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: "All",
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
