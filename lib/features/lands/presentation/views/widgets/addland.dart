import 'dart:io';

import 'package:aplication/advertiser_type.dart';
import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/dialogerror.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/dropdown_estate.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customgridimages.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/pickedimage.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class addland extends StatefulWidget {
  final double width;

  const addland({super.key, required this.width});

  @override
  State<addland> createState() => _addlandState();
}

class _addlandState extends State<addland> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  TextEditingController clientname = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController adressdetails = TextEditingController();
  TextEditingController area = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: Colors.white,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
      child: ListView(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: BlocBuilder<addaqarcuibt, addaqarstate>(
                    builder: (context, state) {
            return        Column(
                      children: [
                        Image.asset(
                          'images/appartments.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          height: Appsizes.size15,
                        ),
                        Text('تسجيل العقارات',
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
                      
                       
                      
                      
                         dropdownbutton(
                          onchanged: (val){
                    
                          },
                          name:BlocProvider.of<addaqarcuibt>(context).advistor_type ,
                            items: ["صاحب الارض", "شركة عقارات"],
                            hint: "نوع المعلن"),
                        const SizedBox(
                          height: 10,
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
                        customgridimages(),
                        const SizedBox(
                          height: Appsizes.size15,
                        ),
                        BlocConsumer<addaqarcuibt, addaqarstate>(
                          listener: (context, state) {
                      
                    
                    
                        },
                         
                          builder:(context, state) {
                           if(state is addaaqarloading) return loading();
                         return custommaterialbutton(
                              onPressed: () async {
                                if(formkey.currentState!.validate()){
                                }
                              },
                              button_name: "تسجيل البيانات",
                              buttonicon: Icons.data_array);
                      })
                      ],
                    );}
                  )
                ),
              )),
        ],
      ),
    );
  }

}
