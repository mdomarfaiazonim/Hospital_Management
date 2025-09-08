import 'package:flutter/material.dart';

class About_Us extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      "name": "Shahariar Khaled Fahim",
      "degree": "B.Sc. in Computer Science and Engineering",
      "university":
          "Chittagong University of Engineering and Technology",
      "location": "Halishohor, Chittagong, Bangladesh"
    },
    {
      "name": "Atri Majumder Arka",
      "degree": "B.Sc. in Computer Science and Engineering",
      "university":
          "Chittagong University of Engineering and Technology",
      "location": "Chawkbazar, Chittagong, Bangladesh"
    },
    {
      "name": "Omar Faiaz Onim",
      "degree": "B.Sc. in Computer Science and Engineering",
      "university":
          "Chittagong University of Engineering and Technology",
      "location": "Maulavi Pukur Par, Chittagong, Bangladesh"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Top banner with image
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                      'https://st4.depositphotos.com/15896940/24010/v/450/depositphotos_240104218-stock-illustration-business-concept-vector-illustration-of.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            /// Intro section with gradient background
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "We are a group of students from Chittagong University of Engineering and Technology.\n"
                    "We are working on this project to help people in need.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  /// Responsive grid for team members
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = constraints.maxWidth > 900
                          ? 3
                          : constraints.maxWidth > 600
                              ? 2
                              : 1;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: teamMembers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final member = teamMembers[index];
                          return Card(
                            elevation: 8,
                            shadowColor: Colors.black54,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.teal[800],
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.person,
                                      size: 80, color: Colors.white),
                                  const SizedBox(height: 12),
                                  Text(
                                    member["name"]!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    member["degree"]!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    member["university"]!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    member["location"]!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
