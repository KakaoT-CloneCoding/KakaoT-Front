class UserModel {
  late String email;
  late String nickname;
  late String profile_image_url;
  // late String token;

  UserModel({email, nickname, profile_image_url});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    nickname = json["nickname"];
    profile_image_url = json["profile_image_url"];
    // token = json["access_token"];
  }
}
