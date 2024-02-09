import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/data/models/showstate/datum.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customgridimages.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/pickedimage.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/lands/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editlanddialog extends StatelessWidget {
  final double width;
  final double height;
  final Datum data;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController clientname;
  final TextEditingController adress;
  final TextEditingController price;
  final TextEditingController phone;
  final TextEditingController details;
  final TextEditingController adressdetails;
  final TextEditingController area;

   editlanddialog({super.key, required this.width, required this.height, required this.data, required this.clientname, required this.adress, required this.price, required this.phone, required this.details, required this.adressdetails, required this.area});

 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCubit, EditState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: Appsizes.size20,
                ),
                Image.asset(
                  'images/appartments.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل الارض',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Form(
                          key: formkey,
                          child: Column(
                            children: [
                              custommytextform(
                                  val: "برجاء ادخال عنوان الارض",
                                  controller: adress,
                                  hintText: "العنوان"),
                              const SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                  val: "برجاء ادخال عنوان الارض بالتفصيل",
                                  controller: adressdetails,
                                  hintText: "عنوان الارض بالتفصيل"),
                              const SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                  val: "يرجي ادخال اسم العميل",
                                  controller: adressdetails,
                                  hintText: "اسم العميل"),
                              const SizedBox(
                                height: 10,
                              ),
                           
                              custommytextform(
                                  keyboardType: TextInputType.number,
                                  val: "برجاء ادخال المساحه",
                                  controller: area,
                                  hintText: "المساحه"),
                              const SizedBox(
                                height: 10,
                              ),
                              custommytextform(
                                  keyboardType: TextInputType.number,
                                  val: "برجاء ادخال سعر المتر",
                                  controller: price,
                                  hintText: "سعر المتر"),
                              const SizedBox(
                                height: Appsizes.size10,
                              ),
                              custommytextform(
                                  keyboardType: TextInputType.number,
                                  val: "برجاء ادخال رقم الهاتف",
                                  controller: phone,
                                  hintText: "رقم االهاتف"),
                            ],
                          ),
                        ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                custommytextform(
                    keyboardType: TextInputType.number,
                    controller: details,
                    hintText: "تفاصيل الاعلان"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
               
                dropdownbutton(
                    onchanged: (val) {
                      BlocProvider.of<EditCubit>(context)
                          .changeaddaqaradvistortype(val);
                    },
                    name: BlocProvider.of<EditlandCubit>(context).advistor_type ==
                            null
                        ? show[data.advertiserType]
                        : BlocProvider.of<EditCubit>(context).advistor_type,
                    items: ["صاحب الارض", "شركة عقارات"],
                    hint: "نوع المعلن"),
              
                const SizedBox(
                  height: Appsizes.size10,
                ),
                custommytextform(
                    controller: details, hintText: "تفاصيل الاعلان"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                choosedate(),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                pickedimage(),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                customgridimages(),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                BlocConsumer<EditlandCubit, EditlandState>(
                  listener: (context, state) {
                    if (state is editlandfailure) {
                      showsnack(comment: state.error_message, context: context);
                    }
                    if (state is editlandsuccess) {
                      Navigator.pop(context);

                      showsnack(
                          comment: state.successmessage, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editlandloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                         
                        },
                        button_name: "تعديل البيانات",
                        buttonicon: Icons.edit);
                  },
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
