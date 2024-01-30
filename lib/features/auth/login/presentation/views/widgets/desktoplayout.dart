import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/textes/textes.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/auth/login/data/models/login_model/loginrequest.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/customimage.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/customtextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/noaccount.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:aplication/features/auth/register/presentation/views/register.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Desktoplayout extends StatefulWidget {
  @override
  State<Desktoplayout> createState() => _DesktoplayoutState();
}

class _DesktoplayoutState extends State<Desktoplayout> {
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

  bool obscureText = true;

  IconData passicon = Icons.visibility_off;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.15),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            customimage(
              width: width * 0.4,
              height: height * 0.5,
              imagename: "images/qqq.jpg",
            ),
            Container(
              width: width * 0.3,
              height: height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: height * 0.15),
              child: Form(
                  key: formkey,
                  child: ListView(
                    children: [
                      customimage(
                          width: width * 0.1,
                          height: height * 0.2,
                          imagename: 'images/building.png'),
                      const Text(Apptextes.login, style: Appstyles.textstle13),
                      const SizedBox(
                        height: Appsizes.size20,
                      ),
                      customtextform(
                          val: "برجاء ادخال رقم الهاتف",
                          controller: phone,
                          prefixicon: Icons.phone,
                          hintText: Apptextes.phone),
                      const SizedBox(
                        height: Appsizes.size20,
                      ),
                      customtextform(
                        val: "برجاء ادخال كلمة المرور",
                        controller: password,
                        prefixicon: Icons.password,
                        hintText: Apptextes.pass,
                        obscureText: obscureText,
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscureText = !obscureText;
                              passicon == Icons.visibility
                                  ? passicon = Icons.visibility_off
                                  : passicon = Icons.visibility;
                              setState(() {});
                            },
                            icon: Icon(passicon,
                                size: Appsizes.size20,
                                color: Appcolors.blackcolor)),
                      ),
                      const SizedBox(
                        height: Appsizes.size20,
                      ),
                      BlocConsumer<logincuibt, loginstate>(
                        builder: (context, state) {
                          if (state is loginloading)
                            return Center(
                              child: CircularProgressIndicator(
                                color: Appcolors.bluecolor,
                              ),
                            );

                          return custommaterialbutton(
                            button_name: Apptextes.login,
                            buttonicon: Icons.login,
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                await BlocProvider.of<logincuibt>(context)
                                    .loginpostdata(
                                        login: loginrequest(
                                            phone: phone.text,
                                            password: password.text,
                                            user_type: "user"));
                              }
                            },
                          );
                        },
                        listener: (BuildContext context, loginstate state) {
                          if (state is loginfailure) {
                            showsnack(
                                comment: state.error_message, context: context);
                          } else if (state is loginsucces) {
                            showsnack(
                                comment: "تم تسجيل الدخول بنجاح",
                                context: context);
                            navigateandfinish(
                                navigationscreen: MyHomePage(),
                                context: context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: Appsizes.size10,
                      ),
                      noaccount(
                          maintext: Apptextes.noaccount,
                          buttontext: Apptextes.registernow,
                          navigated_widget: Register())
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
