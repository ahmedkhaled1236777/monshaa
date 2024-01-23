import 'package:aplication/building.dart';
import 'package:aplication/catch_receipt.dart';
import 'package:aplication/connect.dart';
import 'package:aplication/contract.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/estate.dart';
import 'package:aplication/expense.dart';
import 'package:aplication/features/auth/login/data/repos/loginrepo/loginrepoimplementation.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';
import 'package:aplication/features/auth/logout/data/repo/logoutrepoimplementation.dart';
import 'package:aplication/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:aplication/features/auth/profile/data/repo/profilerepoimplementation.dart';
import 'package:aplication/features/auth/profile/presentation/view/profile.dart';
import 'package:aplication/features/auth/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:aplication/features/auth/register/data/repos/registerrepoimplementation.dart';
import 'package:aplication/features/auth/register/presentation/viewsmodel/registercuibt/registercuibt.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readbuild.dart';
import 'package:aplication/readcontract.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/readexpense.dart';
import 'package:aplication/readtenants.dart';
import 'package:aplication/receipt.dart';
import 'package:aplication/features/auth/register/presentation/views/register.dart';
import 'package:aplication/reports.dart';
import 'package:aplication/revenues.dart';
import 'package:aplication/showbuilding.dart';
import 'package:aplication/showcatch.dart';
import 'package:aplication/showcontract.dart';
import 'package:aplication/showestate.dart';
import 'package:aplication/showtenants.dart';
import 'package:aplication/tenants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Apiservice.initdio();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              logincuibt(loginrepo: login_repo_implementation()),
        ),
        BlocProvider(
            create: (context) =>
                registercuibt(registerrepo: registerrepoimplementation())),
        BlocProvider(
            create: (context) =>
                ProfileCubit(profilerepoimplementation())),
        BlocProvider(
            create: (context) =>
                HomeCubit()),
       
      ],
      child: ScreenUtilInit(
         designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder:(context, child) =>  MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routes: {
            'build': (context) => Building(),
          },
          theme: ThemeData(
            fontFamily: 'Alexandria',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Register(),
        ),
      ),
    );
  }
  //kjkj
}
