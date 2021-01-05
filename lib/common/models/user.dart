import 'dart:convert';

UserLoginResponseModel userLoginResponseModelFromJson(String str) => UserLoginResponseModel.fromJson(json.decode(str));

String userLoginResponseModelToJson(UserLoginResponseModel data) => json.encode(data.toJson());

class UserLoginResponseModel {
  UserLoginResponseModel({
    this.username,
    this.token,
    this.role,
    this.subRole,
    this.name,
    this.id,
    this.truck,
  });

  String username;
  String token;
  String role;
  dynamic subRole;
  String name;
  int id;
  int truck;

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) => UserLoginResponseModel(
        username: json["username"],
        token: json["token"],
        role: json["role"],
        subRole: json["sub_role"],
        name: json["name"],
        id: json["id"],
        truck: json["truck"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "token": token,
        "role": role,
        "sub_role": subRole,
        "name": name,
        "id": id,
        "truck": truck,
      };
}
