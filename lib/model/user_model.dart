class UserModel {
  late dynamic id;
  late String email;
  late String nickname;
  late String profile_image_url;
  late String access_token;
  // late String token;

  UserModel({id, email, nickname, profile_image_url, access_token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    nickname = json["nickname"];
    profile_image_url = json["profile_image_url"];
    access_token = json["access_token"];
    // token = json["access_token"];
  }
}
