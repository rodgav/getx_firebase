class AppUser {
  final String id, username, email;

  AppUser({required this.id, required this.username, required this.email});

  static AppUser fromJson(Map<String, dynamic> json) {
    return AppUser(
        id: json['_id'], username: json['username'], email: json['email']);
  }
}
