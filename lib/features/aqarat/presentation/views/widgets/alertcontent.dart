import 'package:aplication/advertiser_type.dart';
import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/dropdown_estate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/customtextform.dart';
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
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? MediaQuery.of(context).size.width * 0.70
                    : MediaQuery.of(context).size.width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.white,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
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
                          onchanged: (){},
                          name:BlocProvider.of<addaqarcuibt>(context).departement,
                            items: ["بيع", "ايجار"], hint: "القسم"),
                        const SizedBox(
                          height: Appsizes.size10,
                        ),
                        custommytextform(
                            controller: phone, hintText: "رقم الهاتف"),
                        const SizedBox(
                          height: Appsizes.size10,
                        ),
                        custommytextform(
                            controller: pricefrom, hintText: "السعر من"),
                        const SizedBox(
                          height: Appsizes.size10,
                        ),
                        custommytextform(
                            controller: priceto, hintText: "السعر الي"),
                        const SizedBox(
                          height: Appsizes.size10,
                        ),
                        custommytextform(
                            controller: minimumarea, hintText: "اقل مساحه"),
                        const SizedBox(
                          height: 10,
                        ),
                        custommytextform(
                            controller: maximumarea, hintText: "أعلي مساحه"),
                        const SizedBox(
                          height: Appsizes.size10,
                        ),
                        dropdownbutton(onchanged: (){}, items: ["شركة عقارات", "صاحب عقار"], name: BlocProvider.of<addaqarcuibt>(context).advistor_type, hint: "نوع المعلن")
                       
                       , const SizedBox(
                          height: Appsizes.size10,
                        ),
                        custommytextform(
                            controller: advertisecode, hintText: "كود الاعلان"),
                        const SizedBox(
                          height: Appsizes.size20,
                        ),
                        custommaterialbutton(
                          button_name: "بحث",
                          buttonicon: Icons.search,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
