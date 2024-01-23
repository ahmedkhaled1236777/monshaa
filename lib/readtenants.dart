import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/showtenants.dart';
import 'package:aplication/tenants.dart';
import 'package:flutter/material.dart';

import 'building.dart';

class ReadTenants extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReadTenantsState();
  }
}

class ReadTenantsState extends State<ReadTenants> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

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
                'المستاجرين',
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
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xff2BA4C8),
                                                          width: 0.5)),
                                                  child: TextFormField(
                                                    textAlign: TextAlign.right,
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText:
                                                            'اسم المستاجر',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .black38)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xff2BA4C8),
                                                          width: 0.5)),
                                                  child: TextFormField(
                                                    textAlign: TextAlign.right,
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'رقم البطاقة',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .black38)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xff2BA4C8),
                                                          width: 0.5)),
                                                  child: TextFormField(
                                                    textAlign: TextAlign.right,
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'رقم الهاتف',
                                                        hintStyle: TextStyle(
                                                            fontSize: 12,
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return Tenants();
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                color: Color(0xff415769),
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
                                                              0.28,
                                                      child: Text(
                                                          'اسم المستاجر',
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
                                                              0.27,
                                                      child: Text('الهاتف',
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
                                                              0.15,
                                                      child: Text('عقد',
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
                                                              0.15,
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
                                                              0.15,
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
                                                  return ShowTenants();
                                                  ;
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
                                                              0.28,
                                                      child: Text('محمد السيد',
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
                                                              0.27,
                                                      child: Text('01019539347',
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons
                                                                  .add_box_outlined,
                                                              size: 23,
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
                                                            0.15,
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
                                                            0.15,
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
