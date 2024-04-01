import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/connect/data/model/connectmodelrequest.dart';
import 'package:aplication/features/connect/presentation/viewmodel/connect/connectcuibt.dart';
import 'package:aplication/features/connect/presentation/viewmodel/connect/connectstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mobileconnect extends StatelessWidget {
  TextEditingController message = TextEditingController();
  TextEditingController tittle = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Form(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      'images/building.png',
                                      width: 45,
                                      height: 45,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'أبدا مع تطبيق منشاءة وسجل جميع عقاراتك ',
                                      style: TextStyle(
                                          color: Color(0xff246b8d),
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w100),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: const Text(
                                          'تطبيق منشاءة هو عبارة عن نظام ادارة العقارات السكنية على محرك بحث تفصيلي، يمكن العملاء ومديري الموقع من البحث على الوحدات العقارية من خلال فلاتر بحث متنوعة. كما يمكن التحكم بالموقع وإدارته من خلال لوحة التحكم الخاصة به',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w100,
                                              height: 2),
                                          textAlign: TextAlign.justify),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          child: Form(
                                              key: formkey,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: const Text('رساله',
                                                          style: TextStyle(
                                                              fontSize: 12.5,
                                                              color: Color(
                                                                  0xff2ba4c8),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          textAlign:
                                                              TextAlign.right),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    custommytextform(
                                                      controller: tittle,
                                                      hintText: "عنوان الرساله",
                                                      val:
                                                          "لابد من ادخال عنوان الرساله",
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    custommytextform(
                                                      controller: message,
                                                      hintText: "موضوع الرساله",
                                                      maxlines: 4,
                                                      val:
                                                          "لابد من ادخال موضوع الرساله",
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    BlocConsumer<connectCubit,
                                                            connectState>(
                                                        listener:
                                                            (context, state) {
                                                      if (state
                                                          is ConnectStatefailure)
                                                        showsnack(
                                                            comment: state
                                                                .error_message,
                                                            context: context);
                                                      if (state
                                                          is ConnectStatesuccess) {
                                                        tittle.clear();
                                                        message.clear();

                                                        showsnack(
                                                            comment: state
                                                                .success_message,
                                                            context: context);
                                                      }
                                                    }, builder:
                                                            (context, state) {
                                                      if (state
                                                          is ConnectStateloading)
                                                        return loading();
                                                      return custommaterialbutton(
                                                        button_name:
                                                            "ارسال رساله",
                                                        buttonicon: Icons.send,
                                                        onPressed: (() async {
                                                          if (formkey
                                                              .currentState!
                                                              .validate()) {
                                                            await BlocProvider
                                                                    .of<connectCubit>(
                                                                        context)
                                                                .addmessage(
                                                                    token:
                                                                        generaltoken,
                                                                    connect: connectmodelrequest(
                                                                        tittle: tittle
                                                                            .text,
                                                                        messgae:
                                                                            message.text));
                                                          }
                                                        }),
                                                      );
                                                    })
                                                  ],
                                                ),
                                              )),
                                        )),
                                  ])))))
            ])));
  }
}
