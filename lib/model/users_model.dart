class UsersModel {
  String? username;
  String? email;
  String? password;
  bool? isAdmin;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  UsersModel({
    this.username,
    this.email,
    this.password,
    this.isAdmin,
    this.followers,
    this.following,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      username: json['username'],
      email: json['email'],
      password: json["password"],
      isAdmin: json["isAdmin"],
      followers: json["followers"] ?? [],
      following: json["following"] ?? [],
      id: json["_id"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      v: json["__v"],
    );
  }
}
