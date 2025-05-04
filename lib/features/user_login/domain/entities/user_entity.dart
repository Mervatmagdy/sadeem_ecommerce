class UserEntity {
  final String accessToken;
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  UserEntity({
    required this.accessToken,
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
  });
}
