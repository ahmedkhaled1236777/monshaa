import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readcontract.dart';
import 'package:aplication/readestate.dart';
import 'package:flutter/material.dart';

import 'building.dart';

class Contract extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContractState();
  }
}

class ContractState extends State<Contract> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  var date1 = 'الايجار من';
  var date2 = 'الايجار الي';
  var date3 = 'التاريخ';
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
                  'عقود الايجار',
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
                                                          hintText:
                                                              'رقم هاتف المستاجر',
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
                                                              'رقم بطاقة المستاجر',
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
                                                              'رقم هاتف المالك',
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
                                                              'رقم بطاقة المالك',
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
                              titles: 'عقد الايجار',
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
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.27,
                              child: Container(
                                child: Form(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'images/lease.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Text('تسجيل عقد الايجار',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff2ba4c8),
                                                fontWeight: FontWeight.w100),
                                            textAlign: TextAlign.right),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'اسم المستاجر',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'رقم هاتف المستاجر',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'رقم بطاقة المستاجر',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  'عنوان المستاجر الموجود في البطاقة',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'وظيفة المستاجر',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'جنسية المستاجر',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'اسم المالك',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'رقم هاتف المالك',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'رقم البطاقه المالك',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  'عنوان المالك الموجود في البطاقة',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'وظيفة المالك',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'جنسية المالك',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'عنوان العقار',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'نوع العقار',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'المساحة',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'عدد الغرف',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'عدد الحمامات',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'عنوان العقار بالتفصيل',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'رقم العمارة',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'رقم الشقة',
                                              hintStyle: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.black38)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black45,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                  vertical: 20,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () async {
                                              final DateTime? date =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          selectedDate2,
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(3000));
                                              if (date != null) {
                                                setState(() {
                                                  selectedDate2 = date;
                                                  date3 =
                                                      '${date.year}-${date.month}-${date.day}';
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '$date3',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.5,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black45,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                  vertical: 20,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () async {
                                              final DateTime? date =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          selectedDate1,
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(3000));
                                              if (date != null) {
                                                setState(() {
                                                  selectedDate1 = date;
                                                  date1 =
                                                      '${date.year}-${date.month}-${date.day}';
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '$date1',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.5,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black45,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.27,
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 7,
                                                  vertical: 20,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () async {
                                              final DateTime? date =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          selectedDate2,
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(3000));
                                              if (date != null) {
                                                setState(() {
                                                  selectedDate2 = date;
                                                  date2 =
                                                      '${date.year}-${date.month}-${date.day}';
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                '$date2',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.5,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'نوع الايجار',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'قيمة الايجار',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'عمولة الشركة',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'التامين',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'قيمة الخدمات',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  'الخدمات مثل فاتورة كهرباء وصيانه',
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
                                            horizontal: 7, vertical: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'تفاصيل العقار',
                                              hintStyle: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.black38)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(0xff4682a1)),
                                        child: MaterialButton(
                                          padding: EdgeInsets.all(21),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.save,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'تسجيل البيانات',
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
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                              )),
                        ],
                      ),
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.01),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.70,
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
                                                            0.15,
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
                                                            0.15,
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
                                                            0.1,
                                                        child: Text('الهاتف',
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
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                        child: Text('تعديل',
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
                                                        child: Text('حذف',
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
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          surfaceTintColor:
                                                              Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0)),
                                                          title: Container(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                icon: Icon(Icons
                                                                    .close)),
                                                          ),
                                                          content:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.25,
                                                                    child:
                                                                        Container(
                                                                      child: Form(
                                                                          child: SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.25,
                                                                              child: Text('بيانات المستاجر', style: TextStyle(fontSize: 13, color: Color(0xff2ba4c8), fontWeight: FontWeight.w100), textAlign: TextAlign.center),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 25,
                                                                            ),
                                                                            Text(
                                                                              'اسم المستاجر',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'محمد السيد', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'رقم هتف المستاجر',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '01019567896', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'رقم بطاقة المستاجر',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '29845678956432', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'عنوان المستاجر',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'التجمع الثالث', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'وظيفة المستاجر',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'صحفي', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'جنسية المستاجر',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'مصري', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'اسم المالك',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'محمد السيد', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'رقم هتف المالك',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '01019567896', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'رقم بطاقة المالك',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '29845678956432', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'عنوان المالك',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'التجمع الثالث', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'نوع العقار',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'صحفي', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'المساحة',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'مصري', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'عدد الغرف',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'محمد السيد', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'عدد الحمامات',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '01019567896', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'عنوان العقار بالتفصيل',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '29845678956432', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'رقم العمارة',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'التجمع الثالث', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'رقم الشقة',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'صحفي', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'الايجار من',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'مصري', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'الايجار الي',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'محمد السيد', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'نوع الايجار',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '01019567896', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'قيمة الايجار',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: '29845678956432', hintStyle: TextStyle(fontSize: 13.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'التامين',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'التجمع الثالث', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'قيمة الخدمات',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'صحفي', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'تفاصيل العقار',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12.5),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                                                                              child: TextFormField(
                                                                                readOnly: true,
                                                                                textAlign: TextAlign.right,
                                                                                decoration: InputDecoration(border: InputBorder.none, hintText: 'مصري', hintStyle: TextStyle(fontSize: 12.5, color: Colors.black54)),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              20,
                                                                          horizontal:
                                                                              20),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
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
                                                            0.15,
                                                        child: Text(
                                                            'التجمع الثالث',
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
                                                            '01019456789',
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
                                                      Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.1,
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
                                                              0.1,
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
                  'عقود الايجار',
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
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView(
                          children: [
                            Container(
                                width: double.infinity,
                                child: Container(
                                  child: Form(
                                      child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'images/lease.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          child: Text('تسجيل عقد الايجار',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xff2ba4c8),
                                                  fontWeight: FontWeight.w100),
                                              textAlign: TextAlign.right),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'اسم المستاجر',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'رقم هاتف المستاجر',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'رقم بطاقة المستاجر',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'عنوان المستاجر الموجود في البطاقة',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'وظيفة المستاجر',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'جنسية المستاجر',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'اسم المالك',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'رقم هاتف المالك',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'رقم بطاقه المالك',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'عنوان المالك الموجود في البطاقة',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'وظيفة المالك',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'جنسية المالك',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'عنوان العقار',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'نوع العقار',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'المساحة',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'عدد الغرف',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'عدد الحمامات',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'عنوان العقار بالتفصيل',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'رقم العمارة',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'رقم الشقة',
                                                hintStyle: TextStyle(
                                                    fontSize: 12.5,
                                                    color: Colors.black38)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 7,
                                                    vertical: 12,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5))),
                                              onPressed: () async {
                                                final DateTime? date =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            selectedDate2,
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(3000));
                                                if (date != null) {
                                                  setState(() {
                                                    selectedDate2 = date;
                                                    date3 =
                                                        '${date.year}/${date.month}/${date.day}';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  '$date3',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12.5,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 7,
                                                    vertical: 12,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5))),
                                              onPressed: () async {
                                                final DateTime? date =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            selectedDate1,
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(3000));
                                                if (date != null) {
                                                  setState(() {
                                                    selectedDate1 = date;
                                                    date1 =
                                                        '${date.year}/${date.month}/${date.day}';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  '$date1',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12.5,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black45,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 7,
                                                    vertical: 12,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5))),
                                              onPressed: () async {
                                                final DateTime? date =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            selectedDate,
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(3000));
                                                if (date != null) {
                                                  setState(() {
                                                    selectedDate = date;
                                                    date2 =
                                                        '${date.year}/${date.month}/${date.day}';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  '$date2',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12.5,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'نوع الايجار',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'قيمة الايجار',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'عمولة الشركة',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'التامين',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'قيمة الخدمات',
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
                                              horizontal: 7, vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xff2BA4C8),
                                                  width: 0.5)),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'الخدمات مثل فاتورة كهرباء',
                                                hintStyle: TextStyle(
                                                    fontSize: 12.5,
                                                    color: Colors.black38)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xff4682a1)),
                                          child: MaterialButton(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 21, vertical: 0),
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.save,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  'تسجيل البيانات',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.5),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xff4682a1)),
                                          child: MaterialButton(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 21, vertical: 0),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                return ReadContract();
                                              }));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.image_search,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  'عرض البيانات',
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
                                    borderRadius: BorderRadius.circular(0),
                                    color: Colors.white,
                                  ),
                                )),
                          ],
                        ),
                        color: Colors.white),
                  ],
                ),
              )),
        );
      }
    });
  }
}
