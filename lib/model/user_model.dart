class SignupModel {
  String? username;
  String? email;
  String? password;

  SignupModel({
     this.username,
    this.email,
     this.password,
  });

  SignupModel.fromJson(Map<String, dynamic> jsn) {
    username = jsn['username'];
    email = jsn['email'];
    password = jsn['password'];
  }
  Map<String, dynamic> toJson() {
    final data = {'email': email, 'password': password, 'username': username};
    return data;
  }
}

class UserDataModel {
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

  UserDataModel({
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

  UserDataModel.fromSJon(Map<String, dynamic> jsn) {
    username = jsn['message']['username'];
    email = jsn['message']['email'];
    password = jsn['message']['password'];
    isadmin = jsn['message']['isAdmin'];
    followers = jsn['message']['followers'];
    following = jsn['message']['following'];
    id = jsn['message']['_id'];
    createdAt = jsn['message']['createdAt'];
    updatedAt = jsn['message']['updatedAt'];
    v = jsn['message']['__v'];
  }
}
