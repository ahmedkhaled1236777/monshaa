import 'package:aplication/building.dart';
import 'package:aplication/catch_receipt.dart';
import 'package:aplication/connect.dart';
import 'package:aplication/features/contracts/presentation/views/contract.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/employees.dart';
import 'package:aplication/expense.dart';
import 'package:aplication/features/expenses.dart/presentation/views/expenses.dart';
import 'package:aplication/features/financial/presentation/view/financial.dart';
import 'package:aplication/features/home/data/model/homemodel/homemodel.dart';
import 'package:aplication/features/home/data/model/homemodel/sidebar.dart';
import 'package:aplication/features/home/data/repos/homerepoimplementation.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:aplication/features/lands/presentation/views/estateland.dart';
import 'package:aplication/features/reciept/presentaion/view/reciept.dart';
import 'package:aplication/features/revenus/presentation/views/revenues.dart';
import 'package:aplication/features/settings/presentation.dart/views/setting.dart';
import 'package:aplication/receipt.dart';
import 'package:aplication/reports.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/tenants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/homemodel/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final homerepoimplementation homerepo;

  Homemodel? home;
  HomeCubit(this.homerepo) : super(HomeInitial());
  List sidebarpermessions = [];
  List<Home> gridpermessions = [];
  gethome({required String token}) async {
    emit(Homeloading());
    var result = await homerepo.gethome(token: token);
    result.fold((l) {
      emit(Homefailure(error_message: l.error_message));
    }, (r) {
      home = r;
      gridpermessions.clear();
      sidebarpermessions.clear();
      getdrawer(mysidebar: r.data!.sidebar!);
      gridpermessions.addAll(r.data!.home!);
      emit(Homesuccess());
    });
  }

  List sidebar = [
    {
      "name": "الصفحه الرئيسيه",
      "name_en": "home_page",
      "icon": Icons.home,
      "page": MyHomePage(),
      "count": 0
    },
    {
      "name": "العقارات",
      "name_en": "states",
      "icon": Icons.holiday_village_outlined,
      "page": Estate(),
      "count": 0
    },
    {
      "name": "الاراضي",
      "name_en": "lands",
      "icon": Icons.landscape_outlined,
      "page": landsEstate(),
      "count": 0
    },
    {
      "name": "المستاجرين",
      "name_en": "tenants",
      "icon": Icons.verified_user_outlined,
      "page": Tenants(),
      "count": 0
    },
    {
      "name": "عقود الايجار",
      "name_en": "tenant_contracts",
      "icon": Icons.book,
      "page": Contract(
          tenantname: TextEditingController(),
          tenanphone: TextEditingController(),
          tenantcard: TextEditingController(),
          tenantadress: TextEditingController(),
          tenantjob: TextEditingController(),
          tenantnationality: TextEditingController(),
          ownername: TextEditingController(),
          ownerphone: TextEditingController(),
          ownercard: TextEditingController(),
          owneradress: TextEditingController(),
          ownerjob: TextEditingController(),
          ownernationality: TextEditingController(),
          aqaradress: TextEditingController(),
          aqaradressdetails: TextEditingController(),
          aqarmohafza: TextEditingController(),
          aqartype: TextEditingController(),
          area: TextEditingController(),
          emaranumber: TextEditingController(),
          housenumber: TextEditingController(),
          totalvalue: TextEditingController(),
          insuranceval: TextEditingController(),
          commessionvalue: TextEditingController(),
          periodofdelay: TextEditingController()),
      "count": 0
    },
    {
      "name": "سندات القبض",
      "name_en": "financial_receipt",
      "icon": Icons.receipt_long_outlined,
      "page": financials(),
      "count": 0
    },
    {
      "name": "سندات الصرف",
      "name_en": "financial_cash",
      "icon": Icons.receipt_long,
      "page": reciepts(),
      "count": 0
    },
    {
      "name": "المصروفات",
      "name_en": "expenses",
      "icon": Icons.monetization_on_outlined,
      "page": expenses(),
      "count": 0
    },
    {
      "name": "الايردات",
      "name_en": "revenues",
      "icon": Icons.price_change_outlined,
      "page": revenues(),
      "count": 0
    },
    {
      "name": "الموظفين",
      "name_en": "employees",
      "icon": Icons.supervised_user_circle_rounded,
      "page": Employees(),
      "count": 0
    },
    {
      "name": "العملاء",
      "name_en": "employees",
      "icon": Icons.people_alt_outlined,
      "page": Employees(),
      "count": 0
    },
    {
      "name": "التقارير",
      "name_en": "reports",
      "icon": Icons.leaderboard_outlined,
      "page": Reports(),
      "count": 0
    },
    {
      "name": "الاشعارات",
      "name_en": "reports",
      "icon": Icons.notification_add,
      "page": Reports(),
      "count": 0
    },
    {
      "name": "الاعدادات",
      "name_en": "setting",
      "icon": Icons.settings,
      "page": Setting(),
      "count": 0
    },
    {
      "name": "العقود المنتهيه",
      "name_en": "setting",
      "icon": Icons.book,
      "page": Setting(),
      "count": 0
    },
    {
      "name": "الدعم الفني",
      "name_en": "technical_support",
      "icon": Icons.mail,
      "page": Connect(),
      "count": 0
    },
  ];

  getdrawer({required List<Sidebar> mysidebar}) {
    for (int i = 0; i < mysidebar.length; i++) {
      for (int j = 0; j < sidebar.length; j++) {
        if (mysidebar[i].name == sidebar[j]["name"]) {
          sidebar[j]["count"] = mysidebar[i].count;
          sidebarpermessions.add(sidebar[j]);
          break;
        }
      }
    }
  }
}
