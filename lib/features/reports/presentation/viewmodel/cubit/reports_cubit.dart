import 'package:aplication/features/reports/presentation/view/aqaratreports.dart/presentation/view/aqaratreports.dart';
import 'package:aplication/features/reports/presentation/view/landsreports.dart/presentation/views/landsreports.dart';
import 'package:aplication/features/reports/presentation/view/tenantcontractsreports/presentation/view/contractsreport.dart';
import 'package:aplication/lands_reports.dart';
import 'package:bloc/bloc.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());
  List reports = [
    {"name": "العقارات", "page": aqaratreports()},
    {"name": "الاراضي", "page": landatreports()},
    {"name": "عقود الايجار", "page": contractsatreports()},
    {"name": "الايرادات", "page": LandsReports()},
    {"name": "المصروفات", "page": LandsReports()},
    {"name": "الارباح", "page": LandsReports()},
  ];
}
