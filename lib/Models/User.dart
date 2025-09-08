class User{
   String user_id;
   String user_name;
   String user_email;
   String user_password;
   String user_contact;
  User({required this.user_id,required this.user_name,required this.user_email,required this.user_password,required this.user_contact});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'],
      user_name: json['user_name'],
      user_email: json['user_email'],
      user_password: json['user_password'],
      user_contact: json['user_contact'],
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'user_id': user_id,
      'user_name': user_name,
      'user_email': user_email,
      'user_password': user_password,
      'user_contact': user_contact,
    };
  }
}