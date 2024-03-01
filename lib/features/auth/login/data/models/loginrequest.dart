class loginrequest {
  final String password;
  final String phone;

  loginrequest({required this.password, required this.phone});
  tojson() => {"password": password, "phone": phone};
}
