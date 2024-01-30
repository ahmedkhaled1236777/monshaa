import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customtableitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableaqar extends StatefulWidget {
  final double width;
  customtableaqar(this.width);

  @override
  State<customtableaqar> createState() => _customtableaqarState();
}

class _customtableaqarState extends State<customtableaqar> {
  @override
  void initState() {
    BlocProvider.of<ShowaqaratCubit>(context).data.clear();
             BlocProvider.of<ShowaqaratCubit>(context).getallaqarat(
        token:
        generaltoken,
        page: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<addaqarcuibt>(context)
                    .headertable
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                          textStyle: MediaQuery.of(context).size.width > 950
                              ? Appstyles.textStyle13wd
                              : MediaQuery.of(context).size.width < 950 &&
                                      MediaQuery.of(context).size.width > 600
                                  ? Appstyles.textStyle13wd
                                      .copyWith(fontSize: 8.sp)
                                  : Appstyles.textStyle13wd
                                      .copyWith(fontSize: 12.sp),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                listener: (context, state) {
                  if(state is Showaqaratfailure)showsnack(comment: state.error_message, context: context);
                },
                builder: (context, state) {
              if(state is Showaqaratloading)return loading();
             else if(state is Showaqaratfailure)return SizedBox();
                  return ListView.separated(
                                      controller: BlocProvider.of<ShowaqaratCubit>(context).scrollController,

                      itemBuilder: (context, index) {
                    return                  index>=BlocProvider.of<ShowaqaratCubit>(context).data.length? loading():

                        customtableitem(
                          textStyle: MediaQuery.of(context).size.width < 600
                              ? Appstyles.textStyle12b.copyWith(fontSize: 12.sp)
                              : Appstyles.textStyle12b,
                          iconsize:
                              MediaQuery.of(context).size.width < 600 ? 20.sp : 22,
                          adress:BlocProvider.of<ShowaqaratCubit>(context).data[index].realStateAddress! ,
                          section: BlocProvider.of<ShowaqaratCubit>(context).data[index].realStateType!,
                          price: BlocProvider.of<ShowaqaratCubit>(context).data[index].realStatePrice.toString(),
                          type:show[ BlocProvider.of<ShowaqaratCubit>(context).data[index].department!],
                          advertise_type:show[ BlocProvider.of<ShowaqaratCubit>(context).data[index].advertiserType!],
                          edit: IconButton(icon: Icon(Icons.edit,size:  MediaQuery.of(context).size.width < 600 ? 20.sp : 22,),onPressed: (){},),
                          delet: BlocBuilder<ShowaqaratCubit, ShowaqaratState>(
                            builder: (context, state) {
                           
                              return IconButton(icon: Icon(Icons.delete,color: Colors.red,size:  MediaQuery.of(context).size.width < 600 ? 20.sp : 22,),onPressed: (){
                                BlocProvider.of<ShowaqaratCubit>(context).deleteaqar(token: generaltoken, aqarnumber:  BlocProvider.of<ShowaqaratCubit>(context).data[index].id!.toInt());
                              },);
                            }
                          ),);},
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: BlocProvider.of<ShowaqaratCubit>(context).loading==true?
                      BlocProvider.of<ShowaqaratCubit>(context).data.length+1:BlocProvider.of<ShowaqaratCubit>(context).data.length
                      );
                }
              ))
        ]));
  }
}
