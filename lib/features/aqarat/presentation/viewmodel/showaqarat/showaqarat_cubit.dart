import 'package:aplication/features/aqarat/data/models/showstate/datum.dart';
import 'package:aplication/features/aqarat/data/repos/showaqar/showaqarrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'showaqarat_state.dart';

class ShowaqaratCubit extends Cubit<ShowaqaratState> {
 final showaqqarrepoimplementation showaqar;
 List <Datum>data=[];
 ScrollController scrollController=ScrollController();
  ShowaqaratCubit({required this.showaqar}) : super(ShowaqaratInitial()){
    scrollController.addListener(() async {
      
    await getamorellaqarat(token: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzA2NDMwNTc2LCJleHAiOjE3Mzc5NjY1NzYsIm5iZiI6MTcwNjQzMDU3NiwianRpIjoicFE2aDZ4b3dUVWJnOHZNTSIsInN1YiI6IjIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.hGFTzLfWHUmxbtHLdxWscD4bGK8HijQpEhP3QJ5EbmE");
      
    });
  }
  int page=1;
  bool loading=false;
  getallaqarat({required String token,required int page}) async {
    emit(Showaqaratloading());
    var result=await showaqar.showaqar(token: token, page: page);
    loading=true;
    result.fold((failue) {
     
emit(Showaqaratfailure(error_message: failue.error_message));
    }, (success) {
if(success.data!.links?.next==null){
  loading=false;
}
data.addAll(success.data!.data!);
emit(Showaqaratsuccess());
    });
  }
  getamorellaqarat({required String token}) async {
     if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {  
      page++;
    var result=await showaqar.showaqar(token: token, page: page);
    loading=true;
    result.fold((failue) {
     
emit(Showaqaratfailure(error_message: failue.error_message));
    }, (success) {
if(success.data!.links?.next==null){
  loading=false;
}
data.addAll(success.data!.data!);
emit(Showaqaratsuccess());
    });
  }

}
deleteaqar({required String token,required int aqarnumber})async{
  emit(deleteaqarloading());
  var result=await showaqar.deleteaqar(token: token, aqarnumber: aqarnumber);
  result.fold((failure) {
emit(deleteaqarfailure(error_message: failure.error_message));
  }
  , (success){
data.removeWhere((element) => element.id==aqarnumber);
emit(deleteaqarsuccess(successmessage: "تم حذف العقار بنجاح"));
  });
  
  }
}
