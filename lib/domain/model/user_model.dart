class UserModel {
  int userId;
  int id;
  String title;
  bool completed;

  UserModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );
}
