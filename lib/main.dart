import 'package:aplication/building.dart';
import 'package:aplication/features/aqarat/data/repos/addaqar/addaqarimplementation.dart';
import 'package:aplication/features/aqarat/data/repos/editaqar/editaqarrepoimplementation.dart';
import 'package:aplication/features/aqarat/data/repos/showaqar/showaqarrepoimplementation.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/showestate.dart';
import 'package:aplication/features/auth/profile/presentation/view/profile.dart';
import 'package:aplication/features/lands/data/repos/addland/addlandrepoimplementation.dart';
import 'package:aplication/features/lands/data/repos/editland/editlandrepoimplementation.dart';
import 'package:aplication/features/lands/data/repos/showland/showlandrepoimplementation.dart';
import 'package:aplication/features/lands/presentation/viewmodel/addlandcuibt/addlandcuibt.dart';
import 'package:aplication/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/lands/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:aplication/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:aplication/features/lands/presentation/views/estateland.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:aplication/core/services/apiservice.dart';

import 'package:aplication/features/auth/login/data/repos/loginrepo/loginrepoimplementation.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';

import 'package:aplication/features/auth/profile/data/repo/profilerepoimplementation.dart';
import 'package:aplication/features/auth/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:aplication/features/auth/register/data/repos/registerrepoimplementation.dart';
import 'package:aplication/features/auth/register/presentation/viewsmodel/registercuibt/registercuibt.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
// Replace with actual values
    options: const FirebaseOptions(
      apiKey: "api key here",
      appId: "monshaa-b498c",
      messagingSenderId: "messaging id",
      projectId: "monshaa-b498c",
    ),
  );
  Apiservice.initdio();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/qqq',
      [
        NotificationChannel(
            channelKey: 'basic key',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ]);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'basic key',
            title: message.notification!.title));
  });
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
                EditCubit(editrepo: editaqarrepoimplementation())),
        BlocProvider(
            create: (context) =>
                EditlandCubit(editrepo: editlandrepoimplementation())),
        BlocProvider(
            create: (context) => ProfileCubit(profilerepoimplementation())),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(
            create: (context) =>
                addaqarcuibt(addaqarrepo: addaqarimplementation())),
        BlocProvider(create: (context) => DateCubit()),
        BlocProvider(create: (context) => DatelandCubit()),
        BlocProvider(
            create: (context) =>
                ShowaqaratCubit(showaqar: showaqqarrepoimplementation())),
        BlocProvider(
            create: (context) =>
                addlandcuibt(addlandrepo: addlandrepoimplementation())),
        BlocProvider(
            create: (context) =>
                ShowlandsCubit(showlands: showlandsrepoimplementation())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
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
          home: Estate(),
        ),
      ),
    );
  }
  //kjkj
}
