import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/customappbaractions.dart';
import 'package:aplication/features/home/presentation/views/widgets/customgriditem.dart';
import 'package:aplication/features/home/presentation/views/widgets/leadinappbar.dart';
import 'package:aplication/features/notifications/presentations/view/mobilenotifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class mobilelayout extends StatefulWidget {
  final String tablet_or_mobile;

  mobilelayout({super.key, required this.tablet_or_mobile});

  @override
  State<mobilelayout> createState() => _mobilelayoutState();
}

class _mobilelayoutState extends State<mobilelayout> {
  @override
  initState() {
    intializenotification(_firebaseMessagingBackgroundHandler, context);
  }

  final GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scafoldstate,
        appBar: AppBar(
          backgroundColor: Appcolors.maincolor,
          leading: leadingappbar(
            scafoldstate: scafoldstate,
          ),
          title: Text(
            'الرئيسية',
            style: widget.tablet_or_mobile == "mobile"
                ? Appstyles.textStyle14wm
                : Appstyles.textStyle14wt,
          ),
          centerTitle: true,
          actions: [
            customappbaractions(
                onTapnotific: () {
                  navigateto(
                      navigationscreen: mobilenotificationslayout(
                        tablet_or_mobile: "mobile",
                        counter: BlocProvider.of<HomeCubit>(context).sidebar[12]
                            ["count"],
                      ),
                      context: context);
                },
                onTapmessage: () {}),
            SizedBox(
              width: 7.w,
            ),
          ],
        ),
        drawer: Dashboard(),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is Homefailure)
              showsnack(comment: state.error_message, context: context);
          },
          builder: (context, state) {
            if (state is Homeloading)
              return loading();
            else if (state is Homefailure) return SizedBox();
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              width: double.infinity,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          widget.tablet_or_mobile == "tablet" ? 3 : 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  children: BlocProvider.of<HomeCubit>(context)
                      .gridpermessions
                      .map((e) => customgriditem(
                          imagewidth:
                              widget.tablet_or_mobile == "tablet" ? 20.w : 35.w,
                          textfontsize: widget.tablet_or_mobile == "tablet"
                              ? 8.sp
                              : 12.sp,
                          image: e.icon!,
                          onTap: () {},
                          count: e.count!.toInt(),
                          name: e.name!))
                      .toList()),
            );
          },
        ),
      ),
    );
  }
}

intializenotification(
    Future<void> Function(RemoteMessage) fun, BuildContext context) async {
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

  FirebaseMessaging.onBackgroundMessage(fun);
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
    BlocProvider.of<HomeCubit>(context).gethome(token: generaltoken);

    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: BlocProvider.of<HomeCubit>(context).sidebar[12]["count"],
            channelKey: 'basic key',
            body: message.notification!.body,
            title: message.notification!.title));
  });
}
