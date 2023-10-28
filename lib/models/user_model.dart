class UserModel {
  String image;
  String userName;
  String email;
  String password;

  UserModel({
    required this.image,
    required this.userName,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      image: json['users']['image'],
      userName: json['users']['username'],
      email: json['users']['email'],
      password: json['users']['password'],
    );
  }
}
