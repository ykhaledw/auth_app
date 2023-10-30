import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject{
  @HiveField(0)
  String image;
  @HiveField(1)
  String userName;
  @HiveField(2)
  String email;
  @HiveField(3)
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
