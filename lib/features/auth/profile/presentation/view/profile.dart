import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/auth/logout/data/repo/logoutrepoimplementation.dart';
import 'package:aplication/features/auth/logout/presentation/viewmodel/cubit/logout_cubit.dart';
import 'package:aplication/features/auth/profile/presentation/view/widgets/profilebody.dart';
import 'package:aplication/features/auth/profile/presentation/viewmodel/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  getprofile() async {
    await BlocProvider.of<ProfileCubit>(context).getprofile(
        token:
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzA1Nzc2MTUyLCJleHAiOjE3MzczMTIxNTIsIm5iZiI6MTcwNTc3NjE1MiwianRpIjoiU2JEQlZmb1Bwbk1sNklxSyIsInN1YiI6IjIzIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Z6IWqiXZp6ffGXkEqFj6o3y5fVw-gJ2N6hmxOUFhrsw");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getprofile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(logoutrepo: logoutrepoimplementation()),
      child: Scaffold(
          body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is Profilefailure) {
            showsnack(comment: state.error_message, context: context);
          }
        },
        builder: (context, state) {
          if (state is Profileloading) {
            return loading();
          } else if (state is Profilesuccess)
            // ignore: curly_braces_in_flow_control_structures
            return LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return profilebody();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .25),
                  child: profilebody(),
                );
              }
            });
          return const SizedBox();
        },
      )),
    );
  }
}
