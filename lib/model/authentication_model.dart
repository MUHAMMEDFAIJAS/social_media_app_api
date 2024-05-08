class AuthenticationModel {
  String? username;
  String? email;
  String? password;

  AuthenticationModel({
    this.username,
    this.email,
    this.password,
  });

   factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      email: json['email'],
      password: json['password'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    final data = {'email': email, 'password': password, 'username': username};
    return data;
  }
}

class UserModel {
  String? username;
  String? email;
  String? password;
  bool? isadmin;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserModel({
    this.username,
    this.password,
    this.email,
    this.isadmin,
    this.followers,
    this.following,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['user']['username'],
      email: json['user']['email'],
      password: json['user']["password"],
      isadmin: json['user']["isAdmin"],
      followers: json['user']["followers"] ?? [],
      following: json['user']["following"] ?? [],
      id: json['user']["_id"],
      createdAt: json['user']["createdAt"],
      updatedAt: json['user']["updatedAt"],
      v: json['user']["__v"],
    );
  }


}
