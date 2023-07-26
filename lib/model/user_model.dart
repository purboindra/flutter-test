class UserModel {
  final UserDataModel userDataModel;
  final SupportModel supportModel;

  UserModel({
    required this.userDataModel,
    required this.supportModel,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      userDataModel: UserDataModel.fromMap(json["data"]),
      supportModel: SupportModel.fromMap(json["support"]));
}

class UserDataModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserDataModel({
    required this.avatar,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> json) {
    return UserDataModel(
        avatar: json["avatar"],
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"]);
  }
}

class SupportModel {
  final String url;
  final String text;

  SupportModel({
    required this.url,
    required this.text,
  });

  factory SupportModel.fromMap(Map<String, dynamic> json) =>
      SupportModel(url: json["url"], text: json["text"]);
}
