class UserModel {
  String? uid;
  String? email;
  String? username;
  String? profile;
  String? createdat;

  UserModel(
      {this.uid, this.email, this.username, this.profile, this.createdat});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? '';
    email = json['email'] ?? '' ?? '';
    username = json['username'] ?? '';
    profile = json['profile'] ?? '';
    createdat = json['createdat'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['username'] = this.username;
    data['profile'] = this.profile;
    data['createdat'] = this.createdat;
    return data;
  }
}
