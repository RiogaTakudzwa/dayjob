import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/process_jobs/process_jobs_bloc.dart';
import '../presentation/landing_screen.dart';
import 'constraints/colour_scheme.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {

  @override
  void initState() {

    // initialize data before main app shows
    if (mounted){
      BlocProvider.of<ProcessJobsBloc>(context).add(ClearJobsEvent());
      BlocProvider.of<ProcessJobsBloc>(context).add(LoadJobsEvent());
    }

    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
        LandingScreen()
      ));

      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 100,
        width:100,
        child: CircularProgressIndicator(
          color: ColourScheme.mainAppTheme,
        ),
      ),
    );
  }
}
