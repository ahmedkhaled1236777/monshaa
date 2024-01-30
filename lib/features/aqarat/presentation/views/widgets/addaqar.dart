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

class addaqar extends StatefulWidget {
  final double width;

  const addaqar({super.key, required this.width});

  @override
  State<addaqar> createState() => _addaqarState();
}

class _addaqarState extends State<addaqar> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  TextEditingController aqarnumber = TextEditingController();
  TextEditingController housenumber = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController roomsnumber = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController toilletsnumber = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController adressdetails = TextEditingController();
  TextEditingController area = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  DateTime selectedDate1 = DateTime.now();

  var date1 = 'التاريخ';

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
                            controller: aqarnumber, hintText: "رقم العماره"),
                        const SizedBox(
                          height: Appsizes.size10,
                        ),
                        custommytextform(
                            keyboardType: TextInputType.number,
                            controller: housenumber, hintText: "رقم الشقه"),
                        const SizedBox(
                          height: 10,
                        ),
                        dropdownbutton(items:  ["شقه", "فيلا", "محل"], hint: "نوع العقار",name:BlocProvider.of<addaqarcuibt>(context).aqartype 
                        ,onchanged:(val){
                          BlocProvider.of<addaqarcuibt>(context).changeaddaqartype(val);
                        } ,)
                       
                        ,const SizedBox(
                          height: Appsizes.size10,
                        ),
                        dropdownbutton(onchanged: (val){
                                                  BlocProvider.of<addaqarcuibt>(context).changeaddaqardepartement(val);
                    
                        }, items: ["بيع", "ايجار"], name: BlocProvider.of<addaqarcuibt>(context).departement, hint: "القسم")
                    
                        
                        ,const SizedBox(
                          height: Appsizes.size10,
                        ),
                         dropdownbutton(
                          onchanged: (val){
                                                    BlocProvider.of<addaqarcuibt>(context).changeaddaqaradvistortype(val);
                    
                          },
                          name:BlocProvider.of<addaqarcuibt>(context).advistor_type ,
                            items: ["صاحب عقار", "شركة عقارات"],
                            hint: "نوع المعلن"),
                        const SizedBox(
                          height: 10,
                        ),
                        custommytextform(
                            keyboardType: TextInputType.number,
                            controller: toilletsnumber, hintText: "عدد الحمامات"),
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
                        customgridimages(),
                        const SizedBox(
                          height: Appsizes.size15,
                        ),
                        BlocConsumer<addaqarcuibt, addaqarstate>(
                          listener: (context, state) {
                    if(state is addaaqarfailure)showsnack(comment: state.error, context: context)        ;            
                    if(state is addaaqarsuccess){showsnack(comment: "تمت اضافة العقار بنجاح", context: context)        ;
                    
                    BlocProvider.of<addaqarcuibt>(context).cleardata();
                    BlocProvider.of<DateCubit>(context).date1="التاريخ";
                    
                    navigateandfinish(navigationscreen: Estate(), context: context)   ;             }            
                    
                    
                        },
                         
                          builder:(context, state) {
                           if(state is addaaqarloading) return loading();
                         return custommaterialbutton(
                              onPressed: () async {
                                if(formkey.currentState!.validate()){
                                  if(BlocProvider.of<addaqarcuibt>(context).aqartype==null){
                                  dialogerror(context,error: "برجاء اختيار نوع العقار");
                                  }
                                  else if(BlocProvider.of<addaqarcuibt>(context).departement==null){
                                  dialogerror(context,error: "برجاء اختيار القسم");
                                  }
                                 else if(BlocProvider.of<addaqarcuibt>(context).advistor_type==null){
                                  dialogerror(context,error: "برجاء اختيار نوع المعلن");
                                  }
                                  else if(BlocProvider.of<DateCubit>(context).date1=="التاريخ"){
                                       dialogerror(context,error: "برجاء اختيار التاريخ");

                                  }
                                  else{
                                    if(BlocProvider.of<addaqarcuibt>(context).imageFile.isNotEmpty) {
                              await BlocProvider.of<addaqarcuibt>(context)
                                    .uploadimages();
                            }
                          
                                await BlocProvider.of<addaqarcuibt>(context).addaqar(
                                    myaddaqarrequest: addaqarrequest(
                                        real_state_images:
                                            BlocProvider.of<addaqarcuibt>(context)
                                                .images,
                                        real_state_address: adress.text,
                                        real_state_address_details: adressdetails.text,
                                        real_state_type: request[BlocProvider.of<addaqarcuibt>(context).aqartype!] ,
                                        department: request[BlocProvider.of<addaqarcuibt>(context).departement],
                                        advertiser_type:  request[BlocProvider.of<addaqarcuibt>(context).advistor_type],
                                        advertised_phone_number: phone.text,
                                        real_state_space: num.parse(area.text),
                                        real_state_price: num.parse(price.text),
                                        number_of_bathrooms:toilletsnumber.text.isNotEmpty?
                                            int.parse(toilletsnumber.text):null,
                                        number_of_rooms:
                                            int.parse(roomsnumber.text),
                                        advertise_details: details.text,
                                        state_date_register:
                                            BlocProvider.of<DateCubit>(context)
                                                .date1,
                                        apartment_number: housenumber.text,
                                        building_number: aqarnumber.text),
                                        
                                    token:generaltoken);
                                  }

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
