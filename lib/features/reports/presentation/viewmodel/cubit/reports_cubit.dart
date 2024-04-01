import 'package:aplication/features/reports/presentation/view/aqaratreports.dart/presentation/view/aqaratreports.dart';
import 'package:aplication/features/reports/presentation/view/landsreports.dart/presentation/views/landsreports.dart';
import 'package:aplication/features/reports/presentation/view/moneyreports/presentation/view/moneyreports.dart';
import 'package:aplication/features/reports/presentation/view/profitsreports/presentation/view/profitreports.dart';
import 'package:aplication/features/reports/presentation/view/revenusreports.dart/presentation/view/revenusreports.dart';
import 'package:aplication/features/reports/presentation/view/tenantcontractsreports/presentation/view/contractsreport.dart';
import 'package:bloc/bloc.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());
  List reports = [
    {"name": "العقارات", "page": aqaratreports()},
    {"name": "الاراضي", "page": landatreports()},
    {"name": "عقود الايجار", "page": contractsatreports()},
    {"name": "الايرادات", "page": revenusatreports()},
    {"name": "المصروفات", "page": moneyatreports()},
    {"name": "الارباح", "page": profitatreports()},
  ];
}
