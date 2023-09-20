class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String description;

  final String username;
  final bool hasAvatar;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.description,
    required this.username,
    required this.hasAvatar,
  });

  UserProfileModel.enpty()
      : uid = "",
        email = "",
        name = "",
        description = "",
        username = "",
        hasAvatar = false;

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "description": description,
      "username": username,
      "hasAvatar": hasAvatar,
    };
  }

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"],
        description = json["description"],
        username = json["username"],
        hasAvatar = json["hasAvatar"];

  UserProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? description,
    String? username,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      description: description ?? this.description,
      username: username ?? this.username,
      hasAvatar: hasAvatar ?? this.hasAvatar,
    );
  }
}
