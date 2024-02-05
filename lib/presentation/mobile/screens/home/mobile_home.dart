import 'package:dayjob/presentation/mobile/screens/home/widgets/job.dart';
import 'package:dayjob/presentation/mobile/screens/home/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

    if (mounted){
      BlocProvider.of<ProcessJobsBloc>(context).add(ClearJobsEvent());
      BlocProvider.of<ProcessJobsBloc>(context).add(LoadJobsEvent());
      foundJobs = BlocProvider.of<ProcessJobsBloc>(context).state.jobs;
    }

    Hive.box("Jobs").listenable().addListener(() {
      // Bloc Event to reload data from hive box
      if (mounted){
        BlocProvider.of<ProcessJobsBloc>(context).add(ClearJobsEvent());
        BlocProvider.of<ProcessJobsBloc>(context).add(LoadJobsEvent());
        foundJobs = BlocProvider.of<ProcessJobsBloc>(context).state.jobs;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<NavigationBarVisibilityBloc, NavigationBarVisibilityState>(
      builder: (context, navigationBarVisibilityState) {
        return BlocBuilder<ScreenNavigationBloc, ScreenNavigationState>(
          builder: (context, screenNavigationState) {
            return BlocBuilder<ProcessJobsBloc, ProcessJobsState>(
              builder: (context, processJobsState) {

                foundJobs = processJobsState.jobs;

                return SizedBox(
                  height: screenHeight - (screenWidth * ScreenConstraints().buttonHeight),
                  width: screenWidth,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(
                        screenHeight * ScreenConstraints().appBarHeight
                      ), child: const CustomAppBar(),
                    ),

                    body: Column(
                      children: [
                        // Search
                        Container(
                          padding: EdgeInsets.only(
                            left: screenWidth * ScreenConstraints().screenPaddingSides,
                            right: screenWidth * ScreenConstraints().screenPaddingSides,
                            top: screenWidth * ScreenConstraints().screenPaddingSides,
                          ),
                          child: TextFormField(
                            onChanged: (value){
                              // Update search to bloc
                              // BlocProvider.of<ProcessJobsBloc>(context).add(SearchEvent(searchText: value));

                              // Then pass it to search function
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
                        ),
                        // SearchArea(
                        //   searchTextEditingController: searchController,
                        // ),

                        // List of jobs

                        SingleChildScrollView(
                          child: SizedBox(
                            height: 500,
                            child: ListView.builder(
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
                            ),
                          ),
                        ),


                        Expanded(
                          child: Container(),
                        ),

                        // Bottom Navigation Bar
                        const CustomNavigationBar(
                          screenIndexes: [0,2],
                        ),
                      ],
                    ),
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
