import 'package:aplication/aqarat.dart';
import 'package:aplication/building.dart';
import 'package:aplication/catch_receipt.dart';
import 'package:aplication/connect.dart';
import 'package:aplication/contract.dart';
import 'package:aplication/expense.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:aplication/features/lands/presentation/views/estateland.dart';
import 'package:aplication/receipt.dart';
import 'package:aplication/reports.dart';
import 'package:aplication/tenants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List drawer = [
    {"name": "الصفحه الرئيسيه", "icon": Icons.home, "page": MyHomePage()},
    {"name": "العقارات ", "icon": Icons.landscape_outlined, "page": aqart()},
    {"name": "الاراضي", "icon": Icons.landscape_outlined, "page": landsEstate()},
    {
      "name": "المستاجرين",
      "icon": Icons.verified_user_outlined,
      "page": Tenants()
    },
    {"name": "عقود الايجار", "icon": Icons.book, "page": Contract()},
    {"name": "سند قبض", "icon": Icons.receipt_long_outlined, "page": Catch()},
    {"name": "سند صرف", "icon": Icons.receipt_long, "page": Receipt()},
    {
      "name": "المصروفات",
      "icon": Icons.monetization_on_outlined,
      "page": Expense()
    },
    {
      "name": "الموظفين",
      "icon": Icons.supervised_user_circle_rounded,
      "page": Expense()
    },
    {"name": "التقارير", "icon": Icons.leaderboard_outlined, "page": Reports()},
    {"name": "الاعدادات", "icon": Icons.settings, "page": Reports()},
    {"name": "تواصل معنا", "icon": Icons.email, "page": Connect()},
  ];
  List grid = [
    {
      "name": "العمائر",
      "image": "images/building.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "الاراضي",
      "image": "images/land.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "عقارات البيع",
      "image": "images/appartments.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "عفارات الايجار",
      "image": "images/house.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "المستاجرين",
      "image": "images/person.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "عقود الايجار",
      "image": "images/lease.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "الموظفين",
      "image": "images/people.png",
      "page": Building(),
      "count": 400
    },
    {
      "name": "الايرادات",
      "image": 'images/hu.png',
      "page": Building(),
      "count": 400
    },
    {
      "name": "المصروفات",
      "image": 'images/give.png',
      "page": Building(),
      "count": 400
    },
    {
      "name": "الارباح",
      "image": 'images/mo.png',
      "page": Building(),
      "count": 400
    },
  ];
}
