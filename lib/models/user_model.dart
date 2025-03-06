class UserData {
  Map<String, dynamic> user;

  UserData({required this.user});

  factory UserData.fetchUser(Map<String, dynamic> json) {
    return UserData(user: json["data"]);
  }
}
