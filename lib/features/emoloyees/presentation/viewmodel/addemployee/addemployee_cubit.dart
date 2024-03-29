import 'dart:io';

import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:aplication/features/emoloyees/data/repos/addemployeerepo.dart';
import 'package:aplication/features/emoloyees/data/repos/addemployeerepoimplementation.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'addemployee_state.dart';

class AddemployeeCubit extends Cubit<AddemployeeState> {
  final emplyeerepoimplementaion addemployeerepo;
  AddemployeeCubit({required this.addemployeerepo})
      : super(AddemployeeInitial());
  File? image;
  uploadimage() async {
    XFile? pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      image = File(pickedimage!.path);
      emit(changeprofileimage());
    }
  }

  resetimage() {
    image = null;
    emit(changeprofileimage());
  }

  bool loading = false;
  List headertable = [
    "اسم الموظف",
    "العنوان",
    "الوظيفه",
    "رقم الهاتف",
    "تعديل",
    "حذف"
  ];
  Map permessions = {
    "العقارات": "states",
    "الاراضي": "lands",
    "المستاجرين": "tenants",
    "عقود الايجار": "tenant_contracts",
    "سندات القبض": "financial_receipt",
    "سندات الصرف": "financial_cash",
    "المصروفات": "expenses",
    "الموظفين": "employees",
    "التقارير": "reports",
    "الدعم الفني": "technical_support",
    "عقارات البيع": "selling_states",
    "عقارات الايجار": "tenant_stats",
    "الايرادات": "revenues",
    "العملاء": "shops",
    "الاشعارات": "notifications",
    "العقود المنتهيه": "expired_contracts",
    "الارباح": "profits"
  };
  List selecteditems = [];
  getselecteditems() {
    List<String> employeepermession = [];
    for (int i = 0; i < selecteditems.length; i++) {
      employeepermession.add(permessions[selecteditems[i]]);
    }
    return employeepermession;
  }

  addemployee(
      {required String token, required addemployeemodel employee}) async {
    emit(Addemployeeloading());
    var result =
        await addemployeerepo.addemployee(token: token, employee: employee);
    result.fold((failure) {
      emit(Addemployeefailure(error_message: failure.error_message));
    }, (succes) {
      emit(Addemployeesuccess(succes_message: succes));
    });
  }
}
