import 'dart:io';

import 'package:aplication/advertiser_type.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/dropdown_estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/showestate.dart';
import 'package:aplication/type.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'building.dart';
import 'package:image_picker/image_picker.dart';

class Estate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EstateState();
  }
}

class EstateState extends State<Estate> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ';
  var date2 = 'اضغط لاختيار تاريخ محدد';
  List<XFile> imageFile = [];
  final ImagePicker picker = ImagePicker();
  uploadImage() async {
    final List<XFile> pickedimage = await picker.pickMultiImage();

    if (pickedimage.isNotEmpty) {
      imageFile.addAll(pickedimage);
    }

    setState(() {});
  }

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
                  'العقارات',
                  style: TextStyle(color: Colors.white, fontSize: 14.2),
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
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                            vertical: 4),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff2BA4C8),
                                                            width: 0.5)),
                                                    child: Drop(),
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
                                                          hintText: 'السعر من',
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
                                                          hintText: 'السعر الي',
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
                                                          hintText: 'اقل مساحة',
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
                                                              'اعلي مساحة',
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
                                                    width: double.infinity,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                            vertical: 4),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xff2BA4C8),
                                                            width: 0.5)),
                                                    child: Advertiser(),
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
                                                              'كود الاعلان',
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
                              titles: 'العقارات',
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
                                        'images/appartments.png',
                                        height: 50,
                                        width: 50,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Text('تسجيل العقارات',
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
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: TypeEstate(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: Drop(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: Advertiser(),
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
                                              hintText: 'السعر',
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
                                              hintText: 'تفاصيل الاعلان',
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
                                                  vertical: 22,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () async {
                                              final DateTime? date =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: selectedDate,
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(3000));
                                              if (date != null) {
                                                setState(() {
                                                  selectedDate = date;
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
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xff2BA4C8),
                                                width: 0.5)),
                                        child: MaterialButton(
                                          padding: EdgeInsets.all(21),
                                          onPressed: () {
                                            uploadImage();
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 19,
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'اختيار الصور',
                                                style:
                                                    TextStyle(fontSize: 12.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      GridView.builder(
                                          itemCount: imageFile.length,
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10),
                                          itemBuilder: (context, index) {
                                            return Image.file(
                                              File(imageFile[index].path),
                                              fit: BoxFit.cover,
                                            );
                                          }),
                                      SizedBox(
                                        height: 15,
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
                                                            0.1,
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
                                                        child: Text('القسم',
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
                                                        child: Text('السعر',
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
                                                        child: Text('النوع',
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
                                                            'نوع المعلن',
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
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                    return ShowEstate();
                                                  }));
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
                                                            0.1,
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
                                                        child: Text('ايجار',
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
                                                        child: Text('3000',
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
                                                        child: Text('شقة',
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
                                                        child: Text('مكتب',
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
                  'العقارات',
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
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
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
                                            'images/appartments.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            child: Text('تسجيل العقارات',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff2ba4c8),
                                                    fontWeight:
                                                        FontWeight.w100),
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
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xff2BA4C8),
                                                    width: 0.5)),
                                            child: TypeEstate(),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xff2BA4C8),
                                                    width: 0.5)),
                                            child: Drop(),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xff2BA4C8),
                                                    width: 0.5)),
                                            child: Advertiser(),
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
                                                  hintText: 'السعر',
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
                                                  hintText: 'تفاصيل الاعلان',
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 12,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xff2BA4C8),
                                                    width: 0.5)),
                                            child: MaterialButton(
                                              onPressed: () {
                                                uploadImage();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.image,
                                                    size: 19,
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    'اختيار الصور',
                                                    style: TextStyle(
                                                        fontSize: 12.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          GridView.builder(
                                              itemCount: imageFile.length,
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 10),
                                              itemBuilder: (context, index) {
                                                return Image.file(
                                                  File(imageFile[index].path),
                                                  fit: BoxFit.cover,
                                                );
                                              }),
                                          SizedBox(
                                            height: 15,
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
                                                  return ReadEstate();
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
