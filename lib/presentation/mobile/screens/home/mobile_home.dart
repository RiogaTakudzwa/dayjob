import 'package:dayjob/presentation/mobile/screens/home/widgets/job.dart';
import 'package:dayjob/presentation/mobile/screens/home/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constraints/screen_constraits.dart';
import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/bottom_naviagtion_bar/navigation_bar.dart';
import '../../../../domain/navigation_bar_visibility/navigation_bar_visibility_bloc.dart';
import '../../../../domain/process_jobs/process_jobs_bloc.dart';
import '../../../../domain/screen_navigation/screen_navigation_bloc.dart';
import '../../../../repositories/job_model.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {

  TextEditingController searchController = TextEditingController();

  List<JobModel> foundJobs = [];

  filter(String value){
    List<JobModel> result = [];

    if(value.isEmpty){
      result = BlocProvider.of<ProcessJobsBloc>(context).state.jobs;
    }else{
      result = BlocProvider.of<ProcessJobsBloc>(context).state.jobs
      .where(
        (element) => element.jobTitle
          .toLowerCase()
          .contains(value.toLowerCase())
      ).toList();
    }

    setState(() {
      foundJobs = result;
    });
  }

  @override
  void initState() {
    foundJobs = BlocProvider.of<ProcessJobsBloc>(context).state.jobs;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<NavigationBarVisibilityBloc, NavigationBarVisibilityState>(
      builder: (context, navigationBarVisibilityState) {
        return BlocBuilder<ScreenNavigationBloc, ScreenNavigationState>(
          builder: (context, screenNavigationState) {
            return BlocBuilder<ProcessJobsBloc, ProcessJobsState>(
              builder: (context, processJobsState) {

                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(
                      screenHeight * ScreenConstraints().appBarHeight
                    ), child: const CustomAppBar(),
                  ),

                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Search
                        TextFormField(
                          onChanged: (value){
                            filter(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          controller: searchController,
                          obscureText: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: "Search",
                            hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
                            //Before Text field Clicked
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            //After text-field Clicked
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                        // SearchArea(
                        //   searchTextEditingController: searchController,
                        // ),

                        // List of jobs
                        ListView.builder(
                          itemCount: foundJobs.length,
                          itemBuilder: (context, index){
                            return JobWidget(
                              jobTitle: foundJobs.elementAt(index).jobTitle,
                              jobKey: foundJobs.elementAt(index).key,
                              jobType: foundJobs.elementAt(index).jobType,
                              clientName: foundJobs.elementAt(index).clientName,
                              clientAddress: foundJobs.elementAt(index).clientAddress,
                              jobNumber: foundJobs.elementAt(index).jobNumber,
                              jobDetails: foundJobs.elementAt(index).jobDetails,
                              jobState: foundJobs.elementAt(index).jobState,
                              startDate: foundJobs.elementAt(index).startDate,
                              endDate: foundJobs.elementAt(index).endDate,
                            );
                          }
                        )
                      ],
                    ),
                  ),

                  bottomNavigationBar: const CustomNavigationBar(
                    screenIndexes: [0,2],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
