import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/contracts/data/models/contractmodelrequest.dart';
import 'package:aplication/features/contracts/data/repos/contractrepoimplementation.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/contractmodel/datum.dart';

class contractCubit extends Cubit<contractState> {
  final contractrepoimplementation contractrepo;
  contractCubit(this.contractrepo) : super(contractInitial());
  List<String> headertabel = [
    "اسم المستأجر",
    "العنوان",
    "رقم الهاتف",
    "طباعة عقد",
    "تعديل",
    "حذف",
  ];
  int? id;
  String?aqartype;
  String?commessiontype;
  cleardata() {
    aqartype = null;
    commessiontype = null;
   
  
}
  changecommessiontype(String val){
    commessiontype=val;
    emit(changecommison());
  }
  mycleardata(BuildContext context){
     aqartype = null;
    commessiontype = null;
       BlocProvider.of<contractCubit>(context).id=null;
                       BlocProvider.of<contractCubit>(context).aqartype=null;
                                      BlocProvider.of<contractCubit>(context).commessiontype=null;
                                      BlocProvider.of<DateCubit>(context).date1="التاريخ";
                                      BlocProvider.of<DateCubit>(context).date3="الايجار من";
                                      BlocProvider.of<DateCubit>(context).date4="الايجار الي";
                                      emit(cleardatastate());
  }
   changeaddaqartype(String val) {
    aqartype = val;
    emit(changetype());
  }
  Map<String, dynamic>? queryParameters;
  List<Datum> contractdata = [];
  bool loading = false;
  int page = 1;
  addcontract(
      {required String token, required contractmodelrequest contract,int?id}) async {
    emit(Addcontractloading());
    var result = await contractrepo.addcontract(token: token, contract: contract,id: id);
    result.fold((failure) {
      emit(Addcontractfailure(error_message: failure.error_message));
    }, (success) {
      emit(Addcontractsuccess(success_message: success));
    });
  }

  getallmorecontracts({
    required String token,
    
  }) async {
    page++;
    var result = await contractrepo.getcontracts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showcontractfailure(errorr_message: l.error_message));
    }, (r) {
      contractdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showcontractsuccess());
    });
  }

  getallcontracts({required String token, required int page}) async {
    this.page = 1;
    emit(showcontractloadin());
    var result = await contractrepo.getcontracts(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showcontractfailure(errorr_message: l.error_message));
    }, (r) {
      contractdata.clear();

      contractdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showcontractsuccess());
    });
  }

  deletecontract({required String token, required int contractid}) async {
    var result =
        await contractrepo.deletecontract(token: token, contractid: contractid);
    result.fold((failure) {
      emit(deletecontractfailure(errormessage: failure.error_message));
    }, (success) {
      contractdata.removeWhere((element) => element.id == contractid);
      emit(deletecontractsuccess());
    });
  }

  updatecontract(
      {required String token,
      required int id,
      required contractmodelrequest contractmodel}) async {
    emit(editcontractloading());
    var result = await contractrepo.editcontract(
        token: token, id: id, contractmodel: contractmodel);
    result.fold((failure) {
      emit(editcontractfailure(error_message: failure.error_message));
    }, (success) {
      emit(editcontractsuccess(success_message: success));
    });
  }
}
