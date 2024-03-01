import 'dart:io';

import 'package:aplication/advertiser_type.dart';
import 'package:aplication/dropdown_estate.dart';
import 'package:aplication/features/auth/logout/data/repo/logoutrepoimplementation.dart';
import 'package:aplication/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/settings/presentation.dart/views/customitem.dart';
import 'package:aplication/features/settings/presentation.dart/views/customitemwithicon.dart';
import 'package:aplication/features/settings/presentation.dart/views/customsettings.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/type.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../building.dart';
import 'package:image_picker/image_picker.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingState();
  }
}

class SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(logoutrepo: logoutrepoimplementation()),
      child: LayoutBuilder(builder: (context, consters) {
        if (consters.maxWidth >= 950) {
          return customsettings(width: MediaQuery.of(context).size.width * 0.4);
        } else {
          return customsettings(width: MediaQuery.of(context).size.width * 0.9);
        }
      }),
    );
  }
}
