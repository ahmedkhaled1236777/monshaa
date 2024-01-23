import 'package:aplication/estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/readtenants.dart';
import 'package:flutter/material.dart';

import 'building.dart';

class ShowContract extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowContractState();
  }
}

class ShowContractState extends State<ShowContract> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 1100) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              key: scafoldstate,
              backgroundColor: Color(0xff415769),
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
                  'بيانات عقد الايجار',
                  style: TextStyle(color: Colors.white, fontSize: 13.7),
                ),
                centerTitle: true,
                backgroundColor: Color(0xff415769),
                actions: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,

                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                title: Container(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(Icons.close)),
                                ),
                                content: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          child: Container(
                                            child: Form(
                                                child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Text('بحث بواسطة',
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
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                            vertical: 0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff2BA4C8),
                                                            width: 0.5)),
                                                    child: TextFormField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'العنوان',
                                                          hintStyle: TextStyle(
                                                              fontSize: 12.5,
                                                              color: Colors
                                                                  .black38)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                            vertical: 0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff2BA4C8),
                                                            width: 0.5)),
                                                    child: TextFormField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'رقم البطاقة',
                                                          hintStyle: TextStyle(
                                                              fontSize: 12.5,
                                                              color: Colors
                                                                  .black38)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                            vertical: 0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff2BA4C8),
                                                            width: 0.5)),
                                                    child: TextFormField(
                                                      textAlign:
                                                          TextAlign.right,
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'رقم الهاتف',
                                                          hintStyle: TextStyle(
                                                              fontSize: 12.5,
                                                              color: Colors
                                                                  .black38)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color:
                                                            Color(0xff5D8AA8)),
                                                    child: MaterialButton(
                                                      padding:
                                                          EdgeInsets.all(21),
                                                      onPressed: () {},
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'بحث',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13),
                                                          ),
                                                          SizedBox(
                                                            width: 7,
                                                          ),
                                                          Icon(
                                                            Icons.search,
                                                            color: Colors.white,
                                                            size: 19,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 20),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
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
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PdfView(
                              titles: 'المستاجرين',
                            );
                          }));
                        },
                        child: Icon(
                          Icons.print,
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
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Table(
                                          border: TableBorder(
                                              horizontalInside: BorderSide(
                                            color: Colors.black,
                                            width: 0.5,
                                          )),
                                          children: [
                                            TableRow(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff5D8AA8),
                                                ),
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Row(children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: Text(
                                                            'اسم المستاجر',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(13),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: Text('العنوان',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(13),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: Text('الوظيفة',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(13),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: Text(
                                                            'رقم الهاتف',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(13),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                        child: Text(
                                                            'رقم البطاقة',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(13),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: Text('الجنسية',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(13),
                                                      ),
                                                    ]),
                                                  ),
                                                ]),
                                            TableRow(children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: Text(
                                                            'محمد السيد',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: Text(
                                                            'التجمع الخامس',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: Text('صحفي',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: Text(
                                                            '01019539345',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                        child: Text(
                                                            '29856785433678',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: Text('مصري',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100)),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                      ),
                                                    ]),
                                              )
                                            ]),
                                          ],
                                        ),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      } else {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              key: scafoldstate,
              backgroundColor: Colors.white,
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
                  'بيانات عقد الايجار',
                  style: TextStyle(color: Colors.white, fontSize: 13.5),
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
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PdfView(
                              titles: 'المستاجر',
                            );
                          }));
                        },
                        child: Icon(
                          Icons.print,
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
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Table(
                                          border: TableBorder(
                                              horizontalInside: BorderSide(
                                            color: Colors.black,
                                            width: 0.5,
                                          )),
                                          children: [
                                            TableRow(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff5D8AA8),
                                                ),
                                                children: [
                                                  InkWell(
                                                      onTap: () {},
                                                      child:
                                                          SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'اسم المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'جنسية المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'بطاقة المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'وظيفة المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'عنوان المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'هاتف المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ))),
                                                ]),
                                            TableRow(children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  'محمد السيد',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('مصري',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text(
                                                                  '29423456789876',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('كاتب',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  'التجمع الثالث',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text(
                                                                  '01065567897',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      )))
                                            ]),
                                            TableRow(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff5D8AA8),
                                                ),
                                                children: [
                                                  InkWell(
                                                      onTap: () {},
                                                      child:
                                                          SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'اسم المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'جنسية المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'بطاقة المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'وظيفة المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'عنوان المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'هاتف المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ))),
                                                ]),
                                            TableRow(children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  'محمد حسن',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('مصري',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text(
                                                                  '29423456789876',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('صحفي',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  'التجمع الثالث',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text(
                                                                  '01065567897',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      )))
                                            ]),
                                            TableRow(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff5D8AA8),
                                                ),
                                                children: [
                                                  InkWell(
                                                      onTap: () {},
                                                      child:
                                                          SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'عنوان العقار',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'الايجار من',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'رقم العمارة',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'التاريخ',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'الايجا الي',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'رقم الشقة',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ))),
                                                ]),
                                            TableRow(children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  'التجمع الثالث',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  '21-4-2024',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text('5',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  '21-3-2024',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  '21-4-2025',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text('1',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      )))
                                            ]),
                                            TableRow(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff5D8AA8),
                                                ),
                                                children: [
                                                  InkWell(
                                                      onTap: () {},
                                                      child:
                                                          SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'التامين',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'نوع الايجار',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'قيمة الخدمات',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'قيمة الايجار',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.33,
                                                                          child: Text(
                                                                              'عمولة الشركة',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.34,
                                                                          child: Text(
                                                                              'الخدمات',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 10),
                                                                        ),
                                                                      ]),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                ],
                                                              ))),
                                                ]),
                                            TableRow(children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('5000',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text(
                                                                  'كل شهر',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text(
                                                                  'لا يوجد',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('5000',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.33,
                                                              child: Text('5000',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.34,
                                                              child: Text(
                                                                  'لا يوجد',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w100)),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          8,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ]),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      )))
                                            ]),
                                          ],
                                        ),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }
    });
  }
}
