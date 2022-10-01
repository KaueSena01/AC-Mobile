class UserModel {
  String name;
  String email;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'], 
      email: map['email'], 
      password: map['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name, 
      'email': email, 
      'password': password, 
    };
  }
}