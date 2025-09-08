import 'package:flutter/material.dart';
import 'Models/User.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as User?;

    return Scaffold(
      backgroundColor: const Color(0xff1A1A19),
      body: args != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Avatar
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.purple,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          'User Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[700],
                          ),
                        ),
                        const SizedBox(height: 20),

                        Divider(color: Colors.grey[300], thickness: 1),

                        // User details in ListTiles
                        ListTile(
                          leading: Icon(Icons.person, color: Colors.purple),
                          title: Text("Name"),
                          subtitle: Text(args.user_name),
                        ),
                        ListTile(
                          leading: Icon(Icons.email, color: Colors.purple),
                          title: Text("Email"),
                          subtitle: Text(args.user_email),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone, color: Colors.purple),
                          title: Text("Contact"),
                          subtitle: Text(args.user_contact),
                        ),
                        ListTile(
                          leading: Icon(Icons.perm_identity, color: Colors.purple),
                          title: Text("User ID"),
                          subtitle: Text(args.user_id),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
                'No User Found',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
