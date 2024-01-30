class loginrequest {
  final String phone;
  final String password;
  final String user_type;

  loginrequest(
      {required this.phone, required this.password, required this.user_type});
  Map<String, dynamic> toJson() =>
      {"phone": phone, "password": password, "user_type": user_type};
}
