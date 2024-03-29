import 'package:aplication/features/tenants/data/model/tenantmodel/datum.dart';
import 'package:aplication/features/tenants/data/model/tenantmodel/tenantmodel.dart';
import 'package:aplication/features/tenants/data/model/tenantmodelrequest.dart';
import 'package:aplication/features/tenants/data/repo/tenantrepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tenant_state.dart';

class TenantCubit extends Cubit<TenantState> {
  final tenantrepoimplementation tenantrepo;
  TenantCubit(this.tenantrepo) : super(TenantInitial());
  List<String> headertabel = [
    "اسم المستأجر",
    "العنوان",
    "الهاتف",
    "عقد",
    "تعديل",
    "حذف",
  ];
  List<Datum> tenantdata = [];
  Map<String, dynamic>? queryParameters;
  bool loading = false;
  int page = 1;
  addtenant({required String token, required tenentmodelrequest tenant}) async {
    emit(AddTenantloading());
    var result = await tenantrepo.addtenant(token: token, tenant: tenant);
    result.fold((failure) {
      emit(AddTenantfailure(error_message: failure.error_message));
    }, (success) {
      emit(AddTenantsuccess(success_message: success));
    });
  }

  getallmoretenants({
    required String token,
  }) async {
    page++;
    var result = await tenantrepo.gettenants(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showTenantfailure(errorr_message: l.error_message));
    }, (r) {
      tenantdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showTenantsuccess());
    });
  }

  getalltenants({required String token, required int page}) async {
    this.page = 1;
    emit(showTenantloadin());
    var result = await tenantrepo.gettenants(
        token: token, page: page, queryParameters: queryParameters);
    loading = true;
    result.fold((l) {
      emit(showTenantfailure(errorr_message: l.error_message));
    }, (r) {
      tenantdata.clear();

      tenantdata.addAll(r.data!.data!);
      if (r.data!.links!.next == null) loading = false;
      emit(showTenantsuccess());
    });
  }

  deletetenant({required String token, required int tenantid}) async {
    var result =
        await tenantrepo.deletetenant(token: token, tenantid: tenantid);
    result.fold((failure) {
      emit(deleteTenantfailure(errormessage: failure.error_message));
    }, (success) {
      tenantdata.removeWhere((element) => element.id == tenantid);
      emit(deleteTenantsuccess());
    });
  }

  updatetenant(
      {required String token,
      required int id,
      required tenentmodelrequest tenantmodel}) async {
    emit(editTenantloading());
    var result = await tenantrepo.edittenant(
        token: token, id: id, tenantmodel: tenantmodel);
    result.fold((failure) {
      emit(editTenantfailure(error_message: failure.error_message));
    }, (success) {
      emit(editTenantsuccess(success_message: success));
    });
  }

  searchfortenant(String phone, String cardnumber) {
    if (phone.isNotEmpty) {
      tenantdata.removeWhere((element) => element.phone != phone);
    }
    if (cardnumber.isNotEmpty) {
      tenantdata.removeWhere((element) => element.cardNumber != cardnumber);
    }
    emit(deleteTenantsuccess());
  }
}
