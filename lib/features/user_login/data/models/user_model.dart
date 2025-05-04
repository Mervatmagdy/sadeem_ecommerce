import 'package:ecommerce/features/user_login/domain/entities/user_entity.dart';

/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NDYyMTg5NDgsImV4cCI6MTc0NjIyMjU0OH0.XC8XLS6_ATHw3Arj-bCJq9z53ETFtJNuD6AGdIIrvJc"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NDYyMTg5NDgsImV4cCI6MTc0ODgxMDk0OH0.-qZFTMuo5ZN7c4i4LgczqXShlCpi5ey-0UXdvx1Ridc"
/// id : 1
/// username : "emilys"
/// email : "emily.johnson@x.dummyjson.com"
/// firstName : "Emily"
/// lastName : "Johnson"
/// gender : "female"
/// image : "https://dummyjson.com/icon/emilys/128"

class UserModel extends UserEntity{
  UserModel({
      required super.accessToken,
    required this.refreshToken,
    required super.id,
    required super.username,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required this.image,});

  factory UserModel.fromJson(Map<String, dynamic>json) {
    return UserModel(
    accessToken : json['accessToken'],
    refreshToken : json['refreshToken'],
    id : json['id'],
    username : json['username'],
    email : json['email'],
    firstName : json['firstName'],
    lastName : json['lastName'],
    gender : json['gender'],
    image : json['image']);
  }
  String? refreshToken;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['image'] = image;
    return map;
  }

}