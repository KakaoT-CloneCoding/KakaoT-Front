class UserModel {
  late String email;
  late String nickname;
  late String profile_image_url;

  UserModel({email, nickname, profile_image_url});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    nickname = json["nickname"];
    profile_image_url = json["profile_image_url"];
  }
}
