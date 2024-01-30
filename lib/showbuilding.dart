import 'package:aplication/building.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/main.dart';
import 'package:aplication/features/auth/register/presentation/views/register.dart';
import 'package:flutter/material.dart';

class ShowBuilding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowBuildingState();
  }
}

class ShowBuildingState extends State<ShowBuilding> {
  String? name;
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          key: scafoldstate,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                scafoldstate.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            title: Text(
              'بيانات الارض',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                ],
              )
            ],
          ),
          drawer: Dashboard(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1100) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Container(
                            child: Form(
                                child: ListView(
                              shrinkWrap: true,
                              children: [
                                Text(
                                  'تفاصيل الاعلان',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 20, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'التجمع الثالث',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.merge_type,
                                              size: 20, color: Colors.blueGrey),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('100 متر',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.blueGrey))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'سعر المتر: 4000 جنيه',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'السعر الكلي: 400000 جنيه',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'نوع المعلن: صاحب الارض',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'كود الاعلان: ',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      Text(
                                        '35',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'التاريخ: ',
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      Text(
                                        '21-1-2024',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone_android_sharp,
                                          size: 20, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '01019539347',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Text(
                                    'وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 12.5,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              ],
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Container(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: double.infinity,
                              child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.4,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('images/hj.jpg',
                                        fit: BoxFit.fill),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                          )),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: Form(
                                child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'تفاصيل الاعلان',
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,
                                            size: 20, color: Colors.blueGrey),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'التجمع الثالث',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.merge_type,
                                                size: 20,
                                                color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('100 متر',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.blueGrey))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'سعر المتر: 4000 جنيه',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'السعر الكلي: 400000 جنيه',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'نوع المعلن: صاحب الارض',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'كود الاعلان: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Text(
                                          '35',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'التاريخ: ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        Text(
                                          '21-1-2024',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.phone_android_sharp,
                                            size: 20, color: Colors.blueGrey),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '01019539347',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Text(
                                      'وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة وصف الاعلان: ,للايجار شقه بالتجمع الثالث بجوار شركة إنبي للبترول مبنية ارضي وتسعة ادوار مقسمة كالاتي الدور الارضي ثلاث شقق الدور الأول دور بالكامل مساحة الشقة 210 متر الدور الثاني دور بالكامل مساحة الشقة 210 متر الدور التالت دور بالكامل مساحة الشقة 210 متر الدور الرابع شقتينمساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع متاحة ) الدور الخامس شقتين مساحة الشقة 105 متر (الخلفية مباعه اللي على الشارع معروضة للبيع) الدور السادس مباع بالكامل شقة واحدة',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          height: 2,
                                          fontSize: 12,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(20),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'images/hj.jpg',
                                          fit: BoxFit.fill,
                                          height: 200,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'images/hj.jpg',
                                          fit: BoxFit.fill,
                                          height: 200,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'images/hj.jpg',
                                          fit: BoxFit.fill,
                                          height: 200,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'images/hj.jpg',
                                          fit: BoxFit.fill,
                                          height: 200,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Image.asset(
                                          'images/hj.jpg',
                                          fit: BoxFit.fill,
                                          height: 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          )),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
