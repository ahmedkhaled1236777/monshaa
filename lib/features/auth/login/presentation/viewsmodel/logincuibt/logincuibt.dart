import 'package:aplication/features/auth/login/data/models/loginmodel/loginmodel.dart';
import 'package:aplication/features/auth/login/data/models/loginrequest.dart';
import 'package:aplication/features/auth/login/data/repos/loginrepo/loginrepoimplementation.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:bloc/bloc.dart';

// ignore: camel_case_types
class logincuibt extends Cubit<loginstate> {
  Loginmodel? loginModel;

  final login_repo_implementation loginrepo;
  logincuibt({required this.loginrepo}) : super(logininitial());
  // ignore: non_constant_identifier_names
  Future loginpostdata({required loginrequest login}) async {
    // ignore: unused_local_variable
    emit(loginloading());
    var result = await loginrepo.login(login: login);
    result.fold((failure) {
      emit(loginfailure(error_message: failure.error_message));
    }, (success) {
      loginModel = success;
      emit(loginsucces(loginmodel: success));
    });
  }
}
