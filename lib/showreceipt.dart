import 'package:aplication/estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/readtenants.dart';
import 'package:flutter/material.dart';

import 'building.dart';

class ShowReceipt extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowReceiptState();
  }
}

class ShowReceiptState extends State<ShowReceipt> {
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
                  'سندات الصرف',
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
                                                            0.1,
                                                        child: Text('رقم القسط',
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
                                                        child: Text(
                                                            'اسم المالك',
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
                                                            0.05,
                                                        child: Text('المبلغ',
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
                                                        child: Text(
                                                            'الايجار من',
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
                                                            'الايجار الي',
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
                                                        child: Text('التاريخ',
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
                                                        child: Text('طباعة',
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
                                                            0.1,
                                                        child: Text('1',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13.5,
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
                                                        child: Text('احمد حسن',
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
                                                            0.05,
                                                        child: Text('2000',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13.5,
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
                                                        child: Text('21-1-2024',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13.5,
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
                                                        child: Text('21-2-2024',
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
                                                            0.1,
                                                        child: Text('1-1-2024',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13.5,
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
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.print,
                                                              size: 24,
                                                              color: Color(
                                                                  0xff00416A),
                                                            ),
                                                            onPressed: () {},
                                                            alignment: Alignment
                                                                .topCenter,
                                                          )),
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
                  'سندات الصرف',
                  style: TextStyle(color: Colors.white, fontSize: 13),
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
                              titles: 'الارباح',
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
                  children: [
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
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
                                                                              MediaQuery.of(context).size.width * 0.25,
                                                                          child: Text(
                                                                              'رقم القسط',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.3,
                                                                          child: Text(
                                                                              'المبلغ',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.2,
                                                                          child: Text(
                                                                              'الايجار من',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.25,
                                                                          child: Text(
                                                                              'التاريخ',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                      ]),
                                                                  Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.25,
                                                                          child: Text(
                                                                              'اسم المستاجر',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.3,
                                                                          child: Text(
                                                                              'اسم المالك',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.2,
                                                                          child: Text(
                                                                              'الايجار الي',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.25,
                                                                          child: Text(
                                                                              'طباعة',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w100)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 8,
                                                                              horizontal: 8),
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
                                                                  0.25,
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
                                                                          8),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              child: Text('2000',
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
                                                                          8),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.2,
                                                              child: Text(
                                                                  '21-1-2024',
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
                                                                          8),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.25,
                                                              child: Text(
                                                                  '21-1-2024',
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
                                                                          8),
                                                            ),
                                                          ]),
                                                          Row(children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.25,
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
                                                                          8),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
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
                                                                          8),
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.2,
                                                              child: Text(
                                                                  '21-2-2024',
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
                                                                          8),
                                                            ),
                                                            Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.25,
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                      Icons
                                                                          .print,
                                                                      size: 24,
                                                                      color: Color(
                                                                          0xff00416A)),
                                                                  onPressed:
                                                                      () {},
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                )),
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
