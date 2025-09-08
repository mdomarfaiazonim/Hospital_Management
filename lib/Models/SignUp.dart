class SignUp{
  final String user_name;
  final String user_email;
  final String user_contact;
  final String user_id;
  final String user_password;

  SignUp({required this.user_name,required this.user_email,required this.user_contact,required this.user_id,required this.user_password});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      user_name: json['user_name'],
      user_email: json['user_email'],
      user_contact: json['user_contact'],
      user_id: json['user_id'],
      user_password: json['user_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': user_name,
      'user_email': user_email,
      'user_contact': user_contact,
      'user_id': user_id,
      'user_password': user_password,
    };
  }

}