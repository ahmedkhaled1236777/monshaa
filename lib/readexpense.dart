import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/estate.dart';
import 'package:aplication/expense.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/showexpense.dart';
import 'package:flutter/material.dart';

import 'building.dart';

class ReadExpense extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReadExpenseState();
  }
}

class ReadExpenseState extends State<ReadExpense> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ';
  var date2 = 'التاريخ الي';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
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
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
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
                                                          TextAlign.right),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
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
                                                  height: 15,
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
                                                              fontSize: 12.5),
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
                                              vertical: 20, horizontal: 0),
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
                      onTap: () async {
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return Expense();
                }));
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color(0xffBF4F51),
            ),
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
                                                              0.2,
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
                                                              0.2,
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
                                                              0.2,
                                                      child: Text('تعديل',
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
                                                      child: Text('حذف',
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
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                  return ShowExpense();
                                                }));
                                              },
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Text('300',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 13),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Text('مرتب احمد',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 13),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      child: Text('لا يوجد',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 11.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 13),
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons.edit_note,
                                                              size: 29,
                                                              color: Color(
                                                                  0xff00416A)),
                                                          onPressed: () {},
                                                          alignment: Alignment
                                                              .topCenter,
                                                        )),
                                                    Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                        child: IconButton(
                                                          icon: Icon(
                                                            Icons
                                                                .delete_outline_outlined,
                                                            size: 24,
                                                            color: Color(
                                                                0xffBF4F51),
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
    });
  }
}
