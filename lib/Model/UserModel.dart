class UserModel {
  String? uid;
  String? email;
  String? username;
  String? profile;

  UserModel({this.uid, this.email, this.username, this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    username = json['username'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['username'] = this.username;
    data['profile'] = this.profile;
    return data;
  }
}
