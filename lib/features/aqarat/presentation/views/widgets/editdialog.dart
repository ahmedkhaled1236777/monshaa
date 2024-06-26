import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/data/models/showstate/datum.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customgridimages.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/pickedimage.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editdialog extends StatelessWidget {
  final double width;
  final double height;
  final Datum data;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController aqarnumber;
  final TextEditingController advertiser_name;
  final TextEditingController housenumber;
  final TextEditingController adress;
  final TextEditingController phone;
  final TextEditingController roomsnumber;
  final TextEditingController price;
  final TextEditingController toilletsnumber;
  final TextEditingController details;
  final TextEditingController adressdetails;
  final TextEditingController area;

  editdialog(
      {super.key,
      required this.width,
      required this.advertiser_name,
      required this.height,
      required this.aqarnumber,
      required this.data,
      required this.housenumber,
      required this.adress,
      required this.phone,
      required this.roomsnumber,
      required this.price,
      required this.toilletsnumber,
      required this.details,
      required this.adressdetails,
      required this.area});

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
                Text('تعديل عقار',
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
                          val: "برجاء ادخال اسم المعلن",
                          controller: advertiser_name,
                          hintText: "اسم المعلن"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال عنوان العقار",
                          controller: adress,
                          hintText: "عنوان العقار"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          val: "برجاء ادخال عنوان العقار بالتفصيل",
                          controller: adressdetails,
                          hintText: "عنوان العقار بالتفصيل"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          keyboardType: TextInputType.number,
                          val: "برجاء ادخال عدد الغرف",
                          controller: roomsnumber,
                          hintText: "عدد الغرف"),
                      const SizedBox(
                        height: Appsizes.size10,
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
                          val: "برجاء ادخال السعر",
                          controller: price,
                          hintText: "السعر"),
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
                    controller: aqarnumber,
                    hintText: "رقم العماره"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                custommytextform(
                    keyboardType: TextInputType.number,
                    controller: housenumber,
                    hintText: "رقم الشقه"),
                const SizedBox(
                  height: 10,
                ),
                dropdownbutton(
                  items: [
                    "فيلا فارغه",
                    "شقه فارغه",
                    "شقه مفروشه",
                    "فيلا مفروشه",
                    "محل"
                  ],
                  hint: "نوع العقار",
                  name: BlocProvider.of<EditCubit>(context).aqartype == null
                      ? show[data.realStateType]
                      : BlocProvider.of<EditCubit>(context).aqartype,
                  onchanged: (val) {
                    BlocProvider.of<EditCubit>(context).changeaddaqartype(val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                dropdownbutton(
                    onchanged: (val) {
                      BlocProvider.of<EditCubit>(context)
                          .changeaddaqardepartement(val);
                    },
                    items: ["بيع", "ايجار"],
                    name:
                        BlocProvider.of<EditCubit>(context).departement == null
                            ? show[data.department]
                            : BlocProvider.of<EditCubit>(context).departement,
                    hint: "القسم"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                dropdownbutton(
                    onchanged: (val) {
                      BlocProvider.of<EditCubit>(context)
                          .changeaddaqaradvistortype(val);
                    },
                    name: BlocProvider.of<EditCubit>(context).advistor_type ==
                            null
                        ? show[data.advertiserType]
                        : BlocProvider.of<EditCubit>(context).advistor_type,
                    items: ["صاحب عقار", "شركة عقارات"],
                    hint: "نوع المعلن"),
                const SizedBox(
                  height: 10,
                ),
                custommytextform(
                    keyboardType: TextInputType.number,
                    controller: toilletsnumber,
                    hintText: "عدد الحمامات"),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                custommytextform(
                  maxlines: 3,
                    controller: details, hintText: "تفاصيل العقار"),
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
                BlocConsumer<EditCubit, EditState>(
                  listener: (context, state) {
                    if (state is editfailure) {
                      Navigator.pop(context);
                      showsnack(comment: state.error_message, context: context);
                    }
                    if (state is editsuccess) {
                      BlocProvider.of<DateCubit>(context).cleardates();
                      BlocProvider.of<addaqarcuibt>(context).cleardata();
                      navigateandfinish(
                          navigationscreen: Estate(), context: context);

                      showsnack(
                          comment: state.successmessage, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          if (BlocProvider.of<addaqarcuibt>(context)
                              .imageFile
                              .isNotEmpty) {
                            await BlocProvider.of<addaqarcuibt>(context)
                                .uploadimages();
                          }
                          BlocProvider.of<EditCubit>(context).updateaqar(
                              token: generaltoken,
                              id: data.id!.toInt(),
                              add_aqar: addaqarrequest(
                                  advertiser_name: advertiser_name.text,
                                  real_state_address: adress.text,
                                  real_state_images:
                                      BlocProvider.of<addaqarcuibt>(context)
                                          .images,
                                  real_state_address_details:
                                      adressdetails.text,
                                  real_state_type:
                                      BlocProvider.of<EditCubit>(context).aqartype == null
                                          ? data.realStateType
                                          : request[
                                              BlocProvider.of<EditCubit>(context)
                                                  .aqartype!],
                                  department: BlocProvider.of<EditCubit>(context).departement == null
                                      ? data.department
                                      : request[BlocProvider.of<EditCubit>(context)
                                          .departement!],
                                  advertiser_type:
                                      BlocProvider.of<EditCubit>(context).advistor_type == null
                                          ? data.advertiserType
                                          : request[BlocProvider.of<EditCubit>(context).advistor_type!],
                                  advertised_phone_number: phone.text,
                                  real_state_space: num.parse(area.text),
                                  real_state_price: num.parse(price.text),
                                  number_of_rooms: int.parse(roomsnumber.text),
                                  state_date_register: BlocProvider.of<DateCubit>(context).date1,
                                  advertise_details: details.text,
                                  apartment_number: housenumber.text,
                                  number_of_bathrooms: int.parse(toilletsnumber.text),
                                  building_number: aqarnumber.text));
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
