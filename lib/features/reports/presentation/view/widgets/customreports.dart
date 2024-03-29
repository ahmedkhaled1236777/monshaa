import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/reports/presentation/viewmodel/cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customcontainerwidget.dart';

class customreports extends StatelessWidget {
  final String devicetype;
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  customreports({super.key, required this.devicetype});

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<ReportsCubit>(context).reports;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scafoldstate,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              scafoldstate.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'التقارير',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff415769),
        ),
        drawer: Dashboard(),
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: devicetype == "mobile"
                      ? MediaQuery.sizeOf(context).height * 0.13
                      : MediaQuery.sizeOf(context).height * 0.20),
              Image.asset(
                'images/analytics.png',
                width: 42,
                height: 42,
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: devicetype != "mobile"
                        ? MediaQuery.sizeOf(context).width * 0.28
                        : 15),
                child: ListView.separated(
                    itemBuilder: ((context, index) => customcontainer(
                        page: prov[index]["page"],
                        name: prov[index]["name"],
                        mobileordesktop: devicetype)),
                    separatorBuilder: ((context, index) => const SizedBox(
                          height: 15,
                        )),
                    itemCount: prov.length),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
