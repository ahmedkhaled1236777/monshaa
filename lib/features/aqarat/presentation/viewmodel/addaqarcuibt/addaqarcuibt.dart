import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/data/repos/addaqar/addaqarimplementation.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class addaqarcuibt extends Cubit<addaqarstate> {
  final addaqarimplementation addaqarrepo;
  addaqarcuibt({required this.addaqarrepo}) : super(addaaqarintial());
  List<XFile> imageFile = [];
  List? images = [];
String?aqartype;
String?departement;
String?advistor_type;
  List headertable = [
    "العنوان",
    "القسم",
    "السعر",
    "النوع",
    "نوع المعلن",
    "تعديل",
    "حذف"
  ];
  changeaddaqartype(String val){
aqartype=val;
emit(changetype());
  }
  changeaddaqardepartement(String val){
departement=val;
emit(changedepartement());

  }
  changeaddaqaradvistortype(String val){
advistor_type=val;
emit(changeadvistortype());
  }
  addnewimage({required List<XFile> pickedimages}) {
    imageFile.addAll(pickedimages);
    emit(addnewimagestate());
  }

  uploadimages() async {
    for (int i = 0; i < imageFile.length; i++) {
      images!.add(await MultipartFile.fromFile(imageFile[i].path,
          filename: imageFile[i].path.split("/").last));
         
    }
   
  }

  removeimage(int index) {
    imageFile.removeWhere((element) => element == imageFile[index]);
    emit(addnewimagestate());
  }

  addaqar(
      {required addaqarrequest myaddaqarrequest, required String token}) async {
    emit(addaaqarloading());
    var result = await addaqarrepo.addaqar(
        myaddaqarrequest: myaddaqarrequest, token: token);
    result.fold((failure) {
      emit(addaaqarfailure(error: failure.error_message));
    }, (success) {
      emit(addaaqarsuccess(successmessage: success));
    });
  }
 cleardata(){
  aqartype=null;
  advistor_type=null;
  departement=null;
  imageFile=[];
    List images = [];

 }
}
