import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class alertcontent extends StatelessWidget {
  TextEditingController adress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pricefrom = TextEditingController();
  TextEditingController priceto = TextEditingController();
  TextEditingController minimumarea = TextEditingController();
  TextEditingController maximumarea = TextEditingController();
  TextEditingController advertisecode = TextEditingController();
  GlobalKey<FormState> minimumareak = GlobalKey<FormState>();
  GlobalKey<FormState> maxareak = GlobalKey<FormState>();
  GlobalKey<FormState> minpricek = GlobalKey<FormState>();
  GlobalKey<FormState> maxpricek = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<addaqarcuibt, addaqarstate>(builder: (context, state) {
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
                          custommytextform(
                            controller: adress,
                            hintText: "العنوان",
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          dropdownbutton(
                              onchanged: (val) {
                                BlocProvider.of<addaqarcuibt>(context)
                                    .changeaddaqardepartement(val);
                              },
                              name: BlocProvider.of<addaqarcuibt>(context)
                                  .departement,
                              items: ["بيع", "ايجار"],
                              hint: "القسم"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          custommytextform(
                              controller: phone, hintText: "رقم الهاتف"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          Form(
                            key: minpricek,
                            child: custommytextform(
                                val: "برجاء ادخال السعر من",
                                controller: pricefrom,
                                hintText: "السعر من"),
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          Form(
                            key: maxpricek,
                            child: custommytextform(
                                val: "برجاء ادخال السعر الى",
                                controller: priceto,
                                hintText: "السعر الي"),
                          ),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          custommytextform(
                              key: minimumareak,
                              val: "برجاء ادخال اقل مساحه",
                              controller: minimumarea,
                              hintText: "اقل مساحه"),
                          const SizedBox(
                            height: 10,
                          ),
                          custommytextform(
                              key: maxareak,
                              val: "برجاء ادخال اعلي مساحه",
                              controller: maximumarea,
                              hintText: "أعلي مساحه"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          dropdownbutton(
                              onchanged: (val) {
                                BlocProvider.of<addaqarcuibt>(context)
                                    .changeaddaqartype(val);
                              },
                              items: ["شقه", "فيلا", "محل"],
                              name: BlocProvider.of<addaqarcuibt>(context)
                                  .aqartype,
                              hint: "نوع العقار"),
                          const SizedBox(
                            height: Appsizes.size10,
                          ),
                          custommytextform(
                              controller: advertisecode,
                              hintText: "كود الاعلان"),
                          const SizedBox(
                            height: Appsizes.size20,
                          ),
                          custommaterialbutton(
                            button_name: "بحث",
                            buttonicon: Icons.search,
                            onPressed: () {
                              if (minimumarea.text.isEmpty &&
                                  maximumarea.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child:
                                                Text("برجاء ادخال اقل مساحه"),
                                          ),
                                          SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else if (minimumarea.text.isNotEmpty &&
                                  maximumarea.text.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child:
                                                Text("برجاء ادخال اعلي مساحه"),
                                          ),
                                          SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else if (pricefrom.text.isEmpty &&
                                  priceto.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text("برجاء ادخال اقل سعر"),
                                          ),
                                          const SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else if (priceto.text.isEmpty &&
                                  pricefrom.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text("برجاء ادخال اعلي سعر"),
                                          ),
                                          SizedBox(
                                            height: Appsizes.size15,
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("تم")),
                                          )
                                        ],
                                      );
                                    });
                              } else {
                                BlocProvider.of<ShowaqaratCubit>(context)
                                    .queryParameters = {
                                  "real_state_address": adress.text,
                                  "department":request[
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .departement],
                                  "advertised_phone_number": phone.text,
                                  "lowest_price": pricefrom.text.isEmpty
                                      ? null
                                      : num.parse(pricefrom.text),
                                  "highest_price": priceto.text.isEmpty
                                      ? null
                                      : num.parse(priceto.text),
                                  "lowest_space": minimumarea.text,
                                  "highest_space": maximumarea.text,
                                };
                                BlocProvider.of<ShowaqaratCubit>(context)
                                    .data
                                    .clear();
                                BlocProvider.of<ShowaqaratCubit>(context)
                                    .getallaqarat(token: generaltoken, page: 1);
                                Navigator.pop(context);
                              }
                            },
                          )
                        ])),
                  ),
                )
              ])));
    });
  }
}
