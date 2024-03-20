import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/commn/widgets/cashedimage.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:aplication/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:aplication/features/auth/register/presentation/views/widgets/registerbody.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/settings/presentation.dart/views/customitem.dart';
import 'package:aplication/features/settings/presentation.dart/views/customitemwithicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customsettings extends StatelessWidget {
  final double width;
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  customsettings({super.key, required this.width});
  @override
  Widget build(BuildContext context) {
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
              'الاعدادات',
              style: TextStyle(color: Colors.white, fontSize: 14.2),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff415769),
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                ],
              )
            ],
          ),
          drawer: Dashboard(),
          body: Center(
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 69,
                        child: imagefromrequest(
                            url: "url", height: 100, width: 100),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text('الاعدادات',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w100),
                          textAlign: TextAlign.right),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    customitem(
                        description: "اسم الشركه",
                        value: "الفرسان للتسويق العقاري"),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "عنوان الشركه", value: "التجمع التالت"),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "هاتف الشركه", value: "01552770367"),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(description: "اسم المدير", value: "محمد السيد"),
                    SizedBox(
                      height: 10,
                    ),
                    customitem(
                        description: "هاتف المدير", value: "01552770367"),
                    SizedBox(
                      height: 10,
                    ),
                    customitemwithicon(
                      description: 'تعديل الحساب',
                      value: IconButton(
                          onPressed: () {
                            print('hello');
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.deepOrange,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customitemwithicon(
                        description: 'تسجيل الخروج',
                        value: BlocConsumer<LogoutCubit, LogoutState>(
                          listener: (context, state) {
                            if (state is Logoutsuccess) {
                              BlocProvider.of<HomeCubit>(context)
                                  .sidebarpermessions
                                  .clear();
                              BlocProvider.of<HomeCubit>(context)
                                  .gridpermessions
                                  .clear();
                              cashhelper.cleardata();
                              showsnack(
                                  comment: "تم تشجيل الخروج بنجاح",
                                  context: context);
                              navigateandfinish(
                                  navigationscreen: Login(), context: context);
                            }
                            if (state is Logoutfailure) {
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                            }
                          },
                          builder: (context, state) {
                            if (state is loginloading) return loading();
                            return IconButton(
                                onPressed: () {
                                  print(cashhelper.getdata(key: "token"));
                                  BlocProvider.of<LogoutCubit>(context).log_out(
                                      token: cashhelper.getdata(key: "token"));
                                },
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  size: 20,
                                  color: Colors.deepOrange,
                                ));
                          },
                        ))
                  ],
                ),
              )),
            ),
          )),
    );
  }
}
