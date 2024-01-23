import 'dart:io';
import 'dart:typed_data';
import 'package:aplication/pdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'pdt.dart';

class PdfView extends StatelessWidget {
  var titles;
  PdfView({super.key, this.titles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Text(
          '${titles}',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          width: 10,
        ),
      ]),
      body: PdfPreview(
        build: (format) => generateEMSPDF(format, 'منشاءة'),
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}

Future<Uint8List> generateEMSPDF(PdfPageFormat format, String title) async {
  final pdf = pw.Document();
  final ttf = await rootBundle.load("fonts/static/Alexandria-Regular.ttf");
  final font = pw.Font.ttf(ttf);

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context content) {
        return pw.Container(
            width: double.infinity,
            child: pw.Table(
                border: pw.TableBorder(
                    horizontalInside: pw.BorderSide(
                  width: 0.5,
                )),
                children: [
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('المعلن',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.2,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('السعر',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.2,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('المساحة',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('العنوان',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('اسم المستاجر',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('30000000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('محمد السيد حسن حمدى خالد',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('3000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('100',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                  pw.TableRow(children: [
                    pw.Container(
                        width: double.infinity * 0.3,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('مكتب',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.25,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('5000000000',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('200',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('التجمع الثالث',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                    pw.Container(
                        width: double.infinity * 0.15,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: pw.Text('احمد حمدى',
                            style: pw.TextStyle(font: font),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.center)),
                  ]),
                ]));
      }));

  return pdf.save();
}

Future<void> savePdfFile(String fileName, Uint8List byteList) async {
  final output = await getTemporaryDirectory();
  var filePath = "${output.path}/$fileName.pdf";
  final file = File(filePath);
  await file.writeAsBytes(byteList);
  await OpenFile.open(filePath);
}
