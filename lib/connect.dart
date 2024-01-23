import 'package:aplication/building.dart';
import 'package:aplication/estate.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/main.dart';
import 'package:aplication/features/auth/register/presentation/views/register.dart';
import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConnectState();
  }
}

class ConnectState extends State<Connect> {
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
              'تواصل معنا',
              style: TextStyle(color: Colors.white, fontSize: 13.7),
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
                      horizontal: MediaQuery.of(context).size.width * 0.1),
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
                                Image.asset('images/building.png',
                                    width: 50,
                                    height: 50,
                                    alignment: Alignment.topRight),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'أبدا مع تطبيق منشاءة وسجل جميع عقاراتك ',
                                  style: TextStyle(
                                      color: Color(0xff246b8d),
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text(
                                      'تطبيق منشاءة هو عبارة عن نظام ادارة العقارات السكنية على محرك بحث تفصيلي، يمكن العملاء ومديري الموقع من البحث على الوحدات العقارية من خلال فلاتر بحث متنوعة. كما يمكن التحكم بالموقع وإدارته من خلال لوحة التحكم الخاصة به',
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w100,
                                          height: 2),
                                      textAlign: TextAlign.justify),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_city,
                                          size: 22, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('التجمع الخامس - عماره1',
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.attach_email_outlined,
                                          size: 22, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'ralaa1251@gmail.com',
                                        style: TextStyle(
                                            fontSize: 14,
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
                                          size: 22, color: Colors.blueGrey),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('01019539347',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.w100)),
                                    ],
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
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Container(
                            child: Form(
                                child: ListView(
                              shrinkWrap: true,
                              children: [
                                Container(
                                  child: Text('رساله',
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          color: Color(0xff2ba4c8),
                                          fontWeight: FontWeight.w100),
                                      textAlign: TextAlign.right),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Color(0xff2BA4C8),
                                          width: 0.5)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                            Icons.person_add_alt_outlined,
                                            size: 20,
                                            color: Colors.black38),
                                        border: InputBorder.none,
                                        hintText: 'الاسم',
                                        hintStyle: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.black38)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Color(0xff2BA4C8),
                                          width: 0.5)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.phone,
                                            size: 20, color: Colors.black38),
                                        border: InputBorder.none,
                                        hintText: 'رقم الهاتف',
                                        hintStyle: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.black38)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Color(0xff2BA4C8),
                                          width: 0.5)),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined,
                                            size: 20, color: Colors.black38),
                                        border: InputBorder.none,
                                        hintText: 'موضوع الرساله',
                                        hintStyle: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.black38)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xff5D8AA8)),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(21),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 19,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'ارسال رساله',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.5),
                                        ),
                                      ],
                                    ),
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
                    ],
                  ),
                );
              } else {
                return Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                child: Form(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Image.asset(
                                        'images/building.png',
                                        width: 45,
                                        height: 45,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'أبدا مع تطبيق منشاءة وسجل جميع عقاراتك ',
                                        style: TextStyle(
                                            color: Color(0xff246b8d),
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w100),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Text(
                                            'تطبيق منشاءة هو عبارة عن نظام ادارة العقارات السكنية على محرك بحث تفصيلي، يمكن العملاء ومديري الموقع من البحث على الوحدات العقارية من خلال فلاتر بحث متنوعة. كما يمكن التحكم بالموقع وإدارته من خلال لوحة التحكم الخاصة به',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.w100,
                                                height: 2),
                                            textAlign: TextAlign.justify),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.attach_email_outlined,
                                                size: 22,
                                                color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'ralaa1251@gmail.com',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blueGrey),
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
                                            Icon(Icons.phone,
                                                size: 22,
                                                color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('01019539347',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blueGrey)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_city,
                                                size: 22,
                                                color: Colors.blueGrey),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('التجمع الخامس - عماره1',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.blueGrey,
                                                    fontWeight:
                                                        FontWeight.w100)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                child: Form(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('رساله',
                                            style: TextStyle(
                                                fontSize: 12.5,
                                                color: Color(0xff2ba4c8),
                                                fontWeight: FontWeight.w100),
                                            textAlign: TextAlign.right),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.person_add_alt_outlined,
                                                  size: 20,
                                                  color: Colors.black38),
                                              border: InputBorder.none,
                                              hintText: 'الاسم',
                                              hintStyle: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.black38)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.phone,
                                                  size: 20,
                                                  color: Colors.black38),
                                              border: InputBorder.none,
                                              hintText: 'رقم الهاتف',
                                              hintStyle: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.black38)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.email_outlined,
                                                  size: 20,
                                                  color: Colors.black38),
                                              border: InputBorder.none,
                                              hintText: 'موضوع الرساله',
                                              hintStyle: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.black38)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(0xff5D8AA8)),
                                        child: MaterialButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 21, vertical: 6),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.send,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'ارسال رساله',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                              )),
                        ],
                      ),
                    ));
              }
            },
          ),
        ));
  }
}
