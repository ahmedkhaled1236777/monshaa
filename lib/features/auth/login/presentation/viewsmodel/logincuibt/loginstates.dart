// ignore: camel_case_types
abstract class loginstate {}

// ignore: camel_case_types
class logininitial extends loginstate {}

class loginloading extends loginstate {}

// ignore: camel_case_types
class loginsucces extends loginstate {}

// ignore: camel_case_types
class loginfailure extends loginstate {
  final String error_message;

  // ignore: non_constant_identifier_names
  loginfailure({required this.error_message});
}
