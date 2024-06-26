import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/reports/presentation/view/profitsreports/presentation/viewmodel/cubit/profit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';

class profitatalertcontent extends StatefulWidget {
  @override
  State<profitatalertcontent> createState() => _profitatalertcontentState();
}

class _profitatalertcontentState extends State<profitatalertcontent> {
  int? month;

  int? year;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width * 0.70
                      : MediaQuery.of(context).size.width * 0.3,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            Text('بحث بواسطة',
                                style: Appstyles.textStyle12
                                    .copyWith(color: Appcolors.bluecolor),
                                textAlign: TextAlign.right),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () async {
                                String? locale;

                                DateTime? _selected;
                                final localeObj =
                                    locale != null ? Locale(locale) : null;
                                final selected = await showMonthYearPicker(
                                  context: context,
                                  initialDate: _selected ?? DateTime.now(),
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2200),
                                  locale: localeObj,
                                );

                                if (selected != null) {
                                  setState(() {
                                    month = selected.month;
                                    year = selected.year;
                                  });
                                }
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    month == null
                                        ? "اختر التاريخ"
                                        : "${month}-${year}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            custommaterialbutton(
                              button_name: "بحث",
                              buttonicon: Icons.search,
                              onPressed: () {
                                BlocProvider.of<profitatreportsCubit>(context)
                                    .queryParameters = {
                                  "month": year != null
                                      ? month! < 10
                                          ? "0${this.month}"
                                          : this.month
                                      : null,
                                  "year": this.year
                                };
                                Navigator.pop(context);
                                BlocProvider.of<profitatreportsCubit>(context)
                                    .getallprofitat(
                                  token: generaltoken,
                                );
                              },
                            )
                          ]))))
            ])));
  }
}

Future<void> _onPressed({
  required BuildContext context,
  String? locale,
}) async {}
