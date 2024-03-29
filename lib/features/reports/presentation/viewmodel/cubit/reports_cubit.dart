import 'package:aplication/lands_reports.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());
  List reports=[
    {
      "name":"العقارات",
      "page":LandsReports()
    },
    {
      "name":"الاراضي",
      "page":LandsReports()
    },
    {
      "name":"عقود الايجار",
      "page":LandsReports()
    },
    {
      "name":"الايرادات",
      "page":LandsReports()
    },
    {
      "name":"المصروفات",
      "page":LandsReports()
    },
    {
      "name":"الارباح",
      "page":LandsReports()
    },
  ];
}
