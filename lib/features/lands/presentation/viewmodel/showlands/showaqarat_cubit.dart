import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/aqarat/data/models/showstate/datum.dart';
import 'package:aplication/features/aqarat/data/repos/showaqar/showaqarrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'showaqarat_state.dart';

class ShowlandsCubit extends Cubit<ShowlandsState> {
 final showaqqarrepoimplementation showaqar;
   double offset = 0.0 ;

 bool search=true;
 List <Datum>data=[];
 Map<String,dynamic>?queryParameters;
 ScrollController scrollController=ScrollController();
  ShowlandsCubit({required this.showaqar}) : super(ShowlandsInitial()){
    scrollController.addListener(() async {
      
    await getamorelllands(token: generaltoken);
      
    });
    
  }
  int page=1;
  bool loading=false;
  getallalands({required String token,required int page,    
}) async {
    emit(Showlandsloading());
   var result=await showaqar.showaqar(token: token, page: page,queryParameters: queryParameters);
    loading=true;
    result.fold((failue) {
     
emit(Showlandsfailure(error_message: failue.error_message));
    }, (success) {
if(success.data!.links?.next==null){
  loading=false;
}
data.addAll(success.data!.data!);
emit(Showlandssuccess());
    });
  }
  getamorelllands({required String token}) async {
     if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {  
      page++;
    var result=await showaqar.showaqar(token: token, page: page,queryParameters: queryParameters);
    loading=true;
    result.fold((failue) {
     
emit(Showlandsfailure(error_message: failue.error_message));
    }, (success) {
if(success.data!.links?.next==null){
  loading=false;
}
data.addAll(success.data!.data!);
emit(Showlandssuccess());
    });
  }

}
deleteland({required String token,required int aqarnumber})async{
  emit(deletelandsloading());
  var result=await showaqar.deleteaqar(token: token, aqarnumber: aqarnumber);
  result.fold((failure) {
emit(deletelandsfailure(error_message: failure.error_message));
  }
  , (success){
data.removeWhere((element) => element.id==aqarnumber);
emit(deletelandssuccess(successmessage: "تم حذف الارض بنجاح"));
  });
  
  }
}
