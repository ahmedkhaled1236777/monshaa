import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:aplication/features/contracts/presentation/views/customtablecontractitem.dart';
import 'package:aplication/features/contracts/presentation/views/editcontractdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtablecontracts extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablecontracts(this.width);

  @override
  State<customtablecontracts> createState() => _customtablecontractsState();
}

class _customtablecontractsState extends State<customtablecontracts> {
  initscroll() async {
      BlocProvider.of<contractCubit>(context).queryParameters=null;
    await BlocProvider.of<contractCubit>(context)
        .getallcontracts(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<contractCubit>(context)
            .getallmorecontracts(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var contract=BlocProvider.of<contractCubit>(context).contractdata;
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<contractCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف"||e=="اضافة عقد" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<contractCubit, contractState>(
                  listener: (context, state) {
            if (state is showcontractfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
          }, builder: (context, state) {
            if (state is showcontractloadin) return loading();
            if (state is showcontractfailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<contractCubit>(context)
                                  .contractdata
                                  .length
                          ? loading()
                          :  customtablecontractitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  tenantname: BlocProvider.of<contractCubit>(context)
                                      .contractdata[index]
                                      .tenant!.name!
                                      .toString()!,
                                  adress:
                                      BlocProvider.of<contractCubit>(context)
                                          .contractdata[index]
                                          .realStateAddress!,
                                  phone: BlocProvider.of<contractCubit>(context)
                                      .contractdata[index]
                                      .tenant!.phone!,
                                      addcontract: IconButton(onPressed: (){}, 
                                      icon: Icon(Icons.print_rounded)),

                                  delet: IconButton(
                                      onPressed: () async {
                                        await BlocProvider.of<contractCubit>(
                                                context)
                                            .deletecontract(
                                                token: generaltoken,
                                                contractid: BlocProvider.of<
                                                        contractCubit>(context)
                                                    .contractdata[index]
                                                    .id!
                                                    .toInt());
                                      },
                                      icon: Icon(
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 20.sp
                                                : 22,
                                        Icons.delete_outline_outlined,
                                        color: Colors.red,
                                      )),
                                      
                                  edit: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: MediaQuery.of(context).size.width <
                                              600
                                          ? 20.sp
                                          : 22,
                                    ),
                                    onPressed: () {
                           BlocProvider.of<contractCubit>(context).id=contract[index].id!.toInt();

                                      BlocProvider.of<contractCubit>(context).aqartype=show[contract[index].realStateType];
                                      BlocProvider.of<contractCubit>(context).commessiontype=commessionresponse[contract[index].commissionType];
                                      BlocProvider.of<DateCubit>(context).date1=contract[index].contractDate!;
                                      BlocProvider.of<DateCubit>(context).date3=contract[index].contractDateFrom!;
                                      BlocProvider.of<DateCubit>(context).date4=contract[index].contractDateTo!;
                                      showDialog(context: context, builder: (context){
                                        return AlertDialog(
                                          title: Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                                                   BlocProvider.of<contractCubit>(context).mycleardata(context);

                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close)),
              ),
                                                 surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
                                          content: 
                                         
                                            editcontractdialog(
                                              tenantname:TextEditingController(text: contract[index].tenant!.name!),
                                            tenanphone: TextEditingController(text: contract[index].tenant!.phone!),
                                             tenantcard: TextEditingController(text: contract[index].tenant!.cardNumber!), 
                                             tenantadress: TextEditingController(text: contract[index].tenant!.cardAddress!), 
                                             tenantjob: TextEditingController(text: contract[index].tenant!.jobTitle!),
                                              tenantnationality: TextEditingController(text: contract[index].tenant!.nationality!),
                                               ownername: TextEditingController(text: contract[index].ownerName!), 
                                               ownerphone: TextEditingController(text: contract[index].ownerPhone!), 
                                               ownercard: TextEditingController(text: contract[index].ownerCardNumber!),
                                                owneradress: TextEditingController(text: contract[index].ownerCardAddress!), 
                                                ownerjob: TextEditingController(text: contract[index].ownerJobTitle!),
                                                 ownernationality: TextEditingController(text: contract[index].ownerNationality!),
                                                  aqaradress: TextEditingController(text: contract[index].realStateAddress), 
                                                  aqaradressdetails:  TextEditingController(text: contract[index].realStateAddressDetails), 
                                                   aqarmohafza:  TextEditingController(text: contract[index].governorate),
                                                    area:  TextEditingController(text: contract[index].realStateSpace.toString()),
                                                     emaranumber:  TextEditingController(text: contract[index].buildingNumber),
                                                      housenumber:  TextEditingController(text: contract[index].apartmentNumber),
                                                       totalvalue:  TextEditingController(text: contract[index].contractTotal.toString()), 
                                                       insuranceval:  TextEditingController(text: contract[index].insuranceTotal.toString()),
                                                        commessionvalue:  TextEditingController(text: contract[index].commission.toString()),
                                                         periodofdelay:  TextEditingController(text: contract[index].periodOfDelay.toString())),
                                        
                                        );
                                      });
                                    
                                    }));},
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<contractCubit>(context).loading == true
                            ? BlocProvider.of<contractCubit>(context)
                                    .contractdata
                                    .length +
                                1
                            : BlocProvider.of<contractCubit>(context)
                                .contractdata
                                .length));
          }))
        ]));
  }
}
