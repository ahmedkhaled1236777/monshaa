import 'dart:io';

import 'package:aplication/building.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readbuild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpensesState();
  }
}

class ExpensesState extends State<Expenses> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ من';
  var date2 = 'التاريخ الي';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 1100) {
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
                'المصروفات',
                style: TextStyle(color: Colors.white, fontSize: 14),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                                          color:
                                                              Color(0xff2ba4c8),
                                                          fontWeight:
                                                              FontWeight.w100),
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black45,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 7,
                                                                vertical: 22,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5))),
                                                      onPressed: () async {
                                                        final DateTime? date =
                                                            await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    selectedDate,
                                                                firstDate:
                                                                    DateTime(
                                                                        2000),
                                                                lastDate:
                                                                    DateTime(
                                                                        3000));
                                                        if (date != null) {
                                                          setState(() {
                                                            selectedDate = date;
                                                            date1 =
                                                                '${date.year}/${date.month}/${date.day}';
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          '$date1',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black45,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 7,
                                                                vertical: 22,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5))),
                                                      onPressed: () async {
                                                        final DateTime? date =
                                                            await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    selectedDate1,
                                                                firstDate:
                                                                    DateTime(
                                                                        2000),
                                                                lastDate:
                                                                    DateTime(
                                                                        3000));
                                                        if (date != null) {
                                                          setState(() {
                                                            selectedDate1 =
                                                                date;
                                                            date2 =
                                                                '${date.year}/${date.month}/${date.day}';
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          '$date2',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xff5D8AA8)),
                                                  child: MaterialButton(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 20),
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'بحث',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                            titles: 'المصروفات',
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
                      width: 15,
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
                    width: MediaQuery.of(context).size.width * 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 1,
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      child: Text('م',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.all(13),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Text('المبلغ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.all(13),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Text('الوصف',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.all(13),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25,
                                                      child: Text('ملاحظات',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.all(13),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25,
                                                      child: Text('التاريخ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                              child: Row(children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                  child: Text('1',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.all(13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  child: Text('2500',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.all(13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  child: Text('مرتب احمد',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.all(13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  child: Text('لا يوجد',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.all(13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  child: Text('21-1-2024',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.all(13),
                                                ),
                                              ]),
                                            ),
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
            ),
          ),
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
                'المصروفات',
                style: TextStyle(color: Colors.white, fontSize: 13),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
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
                                                          color:
                                                              Color(0xff2ba4c8),
                                                          fontWeight:
                                                              FontWeight.w100),
                                                      textAlign:
                                                          TextAlign.center),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black45,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 7,
                                                                vertical: 12,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5))),
                                                      onPressed: () async {
                                                        final DateTime? date =
                                                            await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    selectedDate,
                                                                firstDate:
                                                                    DateTime(
                                                                        2000),
                                                                lastDate:
                                                                    DateTime(
                                                                        3000));
                                                        if (date != null) {
                                                          setState(() {
                                                            selectedDate = date;
                                                            date1 =
                                                                '${date.year}/${date.month}/${date.day}';
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          '$date1',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black45,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 7,
                                                                vertical: 12,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5))),
                                                      onPressed: () async {
                                                        final DateTime? date =
                                                            await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    selectedDate1,
                                                                firstDate:
                                                                    DateTime(
                                                                        2000),
                                                                lastDate:
                                                                    DateTime(
                                                                        3000));
                                                        if (date != null) {
                                                          setState(() {
                                                            selectedDate1 =
                                                                date;
                                                            date2 =
                                                                '${date.year}/${date.month}/${date.day}';
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          '$date2',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xff5D8AA8)),
                                                  child: MaterialButton(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 6),
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'بحث',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                            titles: 'المصروفات',
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
                    width: MediaQuery.of(context).size.width * 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 1,
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
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      child: Text('م',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 15),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Text('المبلغ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 15),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25,
                                                      child: Text('الوصف',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 15),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.22,
                                                      child: Text('ملاحظات',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 15),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.23,
                                                      child: Text('التاريخ',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 15),
                                                    ),
                                                  ]),
                                                ),
                                              ]),
                                          TableRow(children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Row(children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                  child: Text('1',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.2,
                                                  child: Text('2500',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  child: Text('مرتب احمد',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.22,
                                                  child: Text('لا يوجد',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 13),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.23,
                                                  child: Text('21-1-2024',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.5,
                                                          fontWeight:
                                                              FontWeight.w100)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 13),
                                                ),
                                              ]),
                                            ),
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
            ),
          ),
        );
      }
    });
  }
}
