import 'package:aplication/building.dart';
import 'package:aplication/catch_receipt.dart';
import 'package:aplication/connect.dart';
import 'package:aplication/features/contracts/presentation/views/contract.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/employees.dart';
import 'package:aplication/expense.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:aplication/features/lands/presentation/views/estateland.dart';
import 'package:aplication/features/settings/presentation.dart/views/setting.dart';
import 'package:aplication/receipt.dart';
import 'package:aplication/reports.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/tenants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List drawerpermessions = [];
  List gridpermessions = [];

  List drawer = [
    {
      "name": "الصفحه الرئيسيه",
      "name_en": "home_page",
      "icon": Icons.home,
      "page": MyHomePage()
    },
    {
      "name": "العقارات",
      "name_en": "states",
      "icon": Icons.landscape_outlined,
      "page": Estate()
    },
    {
      "name": "الاراضي",
      "name_en": "lands",
      "icon": Icons.landscape_outlined,
      "page": landsEstate()
    },
    {
      "name": "المستاجرين",
      "name_en": "tenants",
      "icon": Icons.verified_user_outlined,
      "page": Tenants()
    },
    {
      "name": "عقود الايجار",
      "name_en": "tenant_contracts",
      "icon": Icons.book,
      "page": Catch()
    },
    {
      "name": "سند قبض",
      "name_en": "financial_receipt",
      "icon": Icons.receipt_long_outlined,
      "page": Catch()
    },
    {
      "name": "سند صرف",
      "name_en": "financial_cash",
      "icon": Icons.receipt_long,
      "page": Receipt()
    },
    {
      "name": "المصروفات",
      "name_en": "expenses",
      "icon": Icons.monetization_on_outlined,
      "page": Expense()
    },
    {
      "name": "الموظفين",
      "name_en": "employees",
      "icon": Icons.supervised_user_circle_rounded,
      "page": Employees()
    },
    {
      "name": "التقارير",
      "name_en": "reports",
      "icon": Icons.leaderboard_outlined,
      "page": Reports()
    },
    {
      "name": "الاعدادات",
      "name_en": "setting",
      "icon": Icons.settings,
      "page": Setting()
    },
    {
      "name": "تواصل معنا",
      "name_en": "technical_support",
      "icon": Icons.email,
      "page": Connect()
    },
  ];
  List grid = [
    {
      "name": "العقارات",
      "name_en": "states",
      "image": "images/building.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "الاراضي",
      "name_en": "lands",
      "image": "images/land.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "عقارات البيع",
      "name_en": "selling_states",
      "image": "images/appartments.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "عفارات الايجار",
      "name_en": "tenant_stats",
      "image": "images/house.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "المستاجرين",
      "name_en": "tenants",
      "image": "images/person.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "عقود الايجار",
      "name_en": "tenant_contracts",
      "image": "images/lease.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "الموظفين",
      "name_en": "employees",
      "image": "images/people.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "الايرادات",
      "name_en": "revenues",
      "image": 'images/hu.png',
      "page": Building(),
      "count": 400
    },
    {
      "name": "المصروفات",
      "name_en": "expenses",
      "image": 'images/give.png',
      "page": Building(),
      "count": 400
    },
    {
      "name": "الارباح",
      "name_en": "profits",
      "image": 'images/mo.png',
      "page": Building(),
      "count": 400
    },
  ];
  getdrawer({required List permessions}) {
    for (int i = 0; i < permessions.length; i++) {
      for (int j = 0; j < drawer.length; j++) {
        if (permessions[i] == drawer[j]["name_en"]) {
          drawerpermessions.add(drawer[j]);
          break;
        }
      }
    }
  }

  getgrid({required List permessions}) {
    for (int i = 0; i < permessions.length; i++) {
      for (int j = 0; j < grid.length; j++) {
        if (permessions[i] == grid[j]["name_en"]) {
          gridpermessions.add(grid[j]);
          break;
        }
      }
    }
  }
}
