import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vital_aid_on_flutter/Models/User.dart';
import 'Models/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final PageController _pageController= PageController();
  final PageController _logController= PageController();
  TextEditingController userid= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController name= TextEditingController();
  TextEditingController contact= TextEditingController();

  final List<String> _pages=[
    "https://t3.ftcdn.net/jpg/06/12/89/52/360_F_612895290_5m4XeQsdmekGhrRlgId6HB3jfPkKvzwq.jpg",
    "https://st2.depositphotos.com/2065849/8219/i/450/depositphotos_82195114-stock-photo-iv-drip-on-the-background.jpg",
  ];

  final errors={};

  Future<bool> createAccount(SignUp signup) async {    //Create Account
    print(signup.toJson());

    try{
      final response = await http.post(
        Uri.parse('http://localhost:8080/user/add'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(signup.toJson()),
      );
      print("Response: ${response.statusCode}");

      if(response.statusCode==200){
        print("Login Successfull");
        return true;
      }else if(response.statusCode==400){
        print("Login Failed for these reasons:\n");
        errors.clear();
        Map<String, dynamic> data = jsonDecode(response.body);
        data.forEach((key, value) {
          errors[key]=value;
        });
        return false;
      }else {
        print("Login Failed for unknown reasons");
        return false;
      }

    }catch(e){
      print("Error: $e");
      return false;
    }
    return true;
  }



  Future<bool> DoCreate(String name, String email, String contact, String userid, String password) async {
    SignUp signup= SignUp(user_name: name,user_email: email,user_contact: contact,user_id: userid,user_password: password);
    bool isOk= await createAccount(signup);
    return isOk;
  }
  late User user;
  bool found_user=false;

  Future<void> getUser(String email) async {

    try{
      final response = await http.get(
        Uri.parse('http://localhost:8080/user/get/${email}'),
        headers: {'Content-Type': 'application/json'},
      );
      print("Response: ${response.statusCode}");
      if(response.statusCode==200){

        setState(() {
          found_user=true;
          user=User.fromJson(jsonDecode(response.body));
        });
        return ;
      }else{
        setState(() {
          found_user=false;
        });
        throw Exception("Failed to load user");
      }
    }catch(e){
      print("Error: $e");
      throw Exception("Failed to load user");
    }
  }

  
  String? user_email,user_contact;

  Future<bool> fetchUsers() async {
    List<User> userss= [];
    final queryParams = {
      'user_email': user_email!=null? user_email.toString(): '',
      'user_contact': user_contact!=null? user_contact.toString(): ''
    };
    final uri = Uri.http('localhost:8080', '/user/filter', queryParams);

    final response = await http.get(uri);

    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      for (var e in jsonData) {
        if(e['user_email'] != null || e['user_contact'] != null) {
          return true;
        }
      }
      return false;
    } else {
      throw Exception('Failed to load users');
    }
  }
  Future<void> makeLogged() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  bool agree=false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff605EA1),Color(0xff22177A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),

        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height/20,left: MediaQuery.of(context).size.width/20,
              child: Card(
                color: Color(0xff000B58),
                child: Container(
                  height: MediaQuery.of(context).size.height/1.25,
                  width: MediaQuery.of(context).size.width/1.25,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/10,left: MediaQuery.of(context).size.width/2,
              child: Container(
                height: MediaQuery.of(context).size.height/1.3,
                width: MediaQuery.of(context).size.width/2,
                child: PageView.builder(
                  controller: _logController,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return index==0?Column(
                        children: [
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",style: TextStyle(fontSize: MediaQuery.of(context).size.width/100,color: Colors.white),),
                            SizedBox(width: MediaQuery.of(context).size.width/75),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _logController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.linear);
                                });
                              },
                              child: Icon(Icons.arrow_forward,color: Colors.white,),
                            )
                          ],
                        ),
                          SizedBox(height: MediaQuery.of(context).size.height/50),
                          Text("Create an Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/80,color: Colors.white),),
                          SizedBox(height: MediaQuery.of(context).size.height/50),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: name,
                              decoration: InputDecoration(
                                label: Text('Enter Name'),
                                prefixIcon: Icon(Icons.person,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ), //Name
                          SizedBox(height: MediaQuery.of(context).size.height/110),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                label: Text('Enter Email'),
                                prefixIcon: Icon(Icons.email,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ), // Email
                          SizedBox(height: MediaQuery.of(context).size.height/110),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: contact,
                              decoration: InputDecoration(
                                label: Text('Enter Contact Number'),
                                prefixIcon: Icon(Icons.call,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ), // Contact
                          SizedBox(height: MediaQuery.of(context).size.height/110),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: userid,
                              decoration: InputDecoration(
                                label: Text('Enter User ID'),
                                prefixIcon: Icon(Icons.person,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ), // User ID
                          SizedBox(height: MediaQuery.of(context).size.height/110),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                label: Text('Enter Password'),
                                prefixIcon: Icon(Icons.lock,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ), // Password
                          SizedBox(height: MediaQuery.of(context).size.height/150),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      agree=!agree;
                                    });
                                  },
                                  icon: Icon(agree==true?Icons.check_box:Icons.check_box_outline_blank,color: Colors.white,),
                                ),
                                Text("I agree to the terms and conditions  ",style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width/100),),
                                InkWell(
                                    onTap: (){},
                                    child: Text("  Terms and Conditions",style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width/100
                                    ),)
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/150),
                          Center(
                            child: SizedBox(
                                height: (MediaQuery.of(context).size.height)/25,
                                width: (MediaQuery.of(context).size.width)/7,
                                child: Material(
                                  elevation: 3,
                                  shadowColor: Colors.white,
                                  clipBehavior: Clip.antiAlias,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {

                                        if(fetchUsers()==true){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("User already exists",style: TextStyle(color: Colors.red),),
                                              )
                                          );
                                        }else if(agree==false){
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Please agree to the terms and conditions",style: TextStyle(color: Colors.red),),
                                                )
                                            );
                                        }
                                          Future<bool> ok=DoCreate(name.text,email.text,contact.text,userid.text,password.text);
                                          if(ok==true){
                                            makeLogged();

                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("Account created successfully",style: TextStyle(color: Colors.green),),
                                              )
                                          );
                                          
                                          Navigator.pushNamed(context, '/profile',arguments: User(user_name: name.text,user_email: email.text,user_contact: contact.text,user_id: userid.text,user_password: password.text));
                                          }else {
                                            for(var key in errors.keys){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text(errors[key],style: TextStyle(color: Colors.red),),
                                                  )
                                              );
                                            }
                                          }
                                          name.text="";
                                          email.text="";
                                          contact.text="";
                                          userid.text="";
                                          password.text="";
                                        // }

                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Create account",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      side: BorderSide(color: Colors.white,width: 1),
                                      shadowColor: Colors.white,
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xff003161),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          )
                        ],
                      ):Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?",style: TextStyle(fontSize: MediaQuery.of(context).size.width/100,color: Colors.white),),
                              SizedBox(width: MediaQuery.of(context).size.width/75),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _logController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.linear);
                                  });
                                },
                                child: Icon(Icons.arrow_back,color: Colors.white,),
                              )
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/50),
                          Text("Please enter your email and password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width/80,color: Colors.white),),
                          SizedBox(height: MediaQuery.of(context).size.height/50),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                label: Text('Enter Email'),
                                prefixIcon: Icon(Icons.email,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ), // Email
                          SizedBox(height: MediaQuery.of(context).size.height/110),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width)/8,
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                label: Text('Enter Password'),
                                prefixIcon: Icon(Icons.lock,color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                hoverColor: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/90),
                          SizedBox(
                              height: MediaQuery.of(context).size.height/25,
                              width: MediaQuery.of(context).size.width/7,
                              child: Material(
                                elevation: 3,
                                shadowColor: Colors.white,
                                clipBehavior: Clip.antiAlias,
                                child: ElevatedButton(
                                  onPressed: (){
                                    setState(() {
                                      if(email.text=="" || password.text==""){
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Error",style: TextStyle(color: Colors.red),),
                                              content: Text("Please fill all the fields",style: TextStyle(color: Colors.red),),
                                            );
                                          },
                                        );
                                      }else if(!email.text.contains("@") || !email.text.contains(".")) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Error",
                                                style: TextStyle(color: Colors.red),),
                                              content: Text("Invalid email address",
                                                style: TextStyle(color: Colors.red),),
                                            );
                                          },
                                        );
                                      }else{
                                        getUser(email.text);
                                        print("------------Check User------------");
                                        print(user.user_password);
                                        print(user.user_email);
                                        print("------------Check User------------");

                                        if(found_user==false){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("User not found",style: TextStyle(color: Colors.red),),
                                              )
                                          );
                                        }else if(user.user_password!=password.text){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("Incorrect password",style: TextStyle(color: Colors.red),),
                                              )
                                          );
                                      }else if(user.user_password==password.text && user.user_email==email.text){
                                          Navigator.pushNamed(context, '/profile',arguments: user);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("Login successful",style: TextStyle(color: Colors.green),),
                                              )
                                          );
                                          makeLogged();
                                        }
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(color: Colors.white,width: 1),
                                    shadowColor: Colors.white,
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xff003161),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      );
                    },
                )
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/15,
              left: MediaQuery.of(context).size.width/15,
              child: Container(
                height: MediaQuery.of(context).size.height/1.5,
                width: MediaQuery.of(context).size.width/2,
                color: Colors.white,
                child: GestureDetector(
                  onTap: (){
                    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
                  child: Scaffold(
                    body: PageView.builder(
                      controller: _pageController,
                      itemCount: _pages.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height/2-20,
                            width: MediaQuery.of(context).size.height/2-20,
                              child: Image.network(_pages[index%_pages.length],fit: BoxFit.cover,)
                          );
                        },
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }

  


}



