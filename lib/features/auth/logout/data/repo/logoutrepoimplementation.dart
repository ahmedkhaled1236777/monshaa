import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/auth/logout/data/repo/logoutrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class logoutrepoimplementation extends logoutrepo{
  @override
  Future<Either<failure, String>> logout({required String token})async {
   try{
Response response=await Postdata.postdata(path: urls.log_out,token: token);
if(response.statusCode==200&&response.data["message"]=="تم تسجيل خروج الشركه بنجاح"){
  return right(response.data["message"]);
}
else return left(requestfailure(error_message: response.data["message"]));
   }catch(e){
if(e is DioException)return left(requestfailure.fromdioexception(e));
else return left(requestfailure(error_message: e.toString()));
   }
  }
  
}