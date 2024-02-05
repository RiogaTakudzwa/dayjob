import 'package:dayjob/common/widgets/text/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constraints/colour_scheme.dart';
import '../../../../common/constraints/screen_constraits.dart';
import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../domain/process_jobs/process_jobs_bloc.dart';
import '../../../../domain/screen_navigation/screen_navigation_bloc.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {

  void deleteJob() {
    // Delete job
    BlocProvider.of<ProcessJobsBloc>(context)
        .add(SearchEvent(searchString: ""));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ProcessJobsBloc, ProcessJobsState>(
      builder: (context, processJobsState) {

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

                Container(
                  margin: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                    bottom: screenWidth * ScreenConstraints().screenPaddingSides/2,
                    top: screenWidth * ScreenConstraints().screenPaddingSides/2,
                  ),
                  padding: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                  ),
                  child: Row(
                    children: [
                      const TitleText(text: "Job Number"),
                      const Text(" : "),
                      Text(processJobsState.jobNumber)
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                    bottom: screenWidth * ScreenConstraints().screenPaddingSides/2,
                    top: screenWidth * ScreenConstraints().screenPaddingSides/2,
                  ),
                  padding: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                  ),
                  child: Row(
                    children: [
                      const TitleText(text: "Job Type"),
                      const Text(" : "),
                      Text(processJobsState.jobType)
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                    bottom: screenWidth * ScreenConstraints().screenPaddingSides/2,
                    top: screenWidth * ScreenConstraints().screenPaddingSides/2,
                  ),
                  padding: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                  ),
                  child: Row(
                    children: [
                      const TitleText(text: "Client Name"),
                      const Text(" : "),
                      Text(processJobsState.clientName)
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                    bottom: screenWidth * ScreenConstraints().screenPaddingSides/2,
                    top: screenWidth * ScreenConstraints().screenPaddingSides/2,
                  ),
                  padding: EdgeInsets.only(
                    left: screenWidth * ScreenConstraints().screenPaddingSides,
                    right: screenWidth * ScreenConstraints().screenPaddingSides,
                  ),
                  child: Row(
                    children: [
                      const TitleText(text: "Client Address"),
                      const Text(" : "),
                      Text(processJobsState.clientAddress)
                    ],
                  ),
                ),

                Expanded(
                  child: Container(),
                ),

                //Submit button
                GestureDetector(
                  onTap: (){

                      // Delete job
                      BlocProvider.of<ProcessJobsBloc>(context).add(DeleteJobEvent(
                        jobKey: processJobsState.jobKey,
                      ));

                      BlocProvider.of<ScreenNavigationBloc>(context).add(
                          const UpdateBackButtonStateEvent(
                            isBackButtonActive: false,
                          ));

                      BlocProvider.of<ScreenNavigationBloc>(context).add(
                          const UpdateScreenTitleEvent(
                              screenTitle: "Home"
                          ));

                      BlocProvider.of<ScreenNavigationBloc>(context).add(
                          const UpdateScreenIndexEvent(
                              index: 0
                          ));

                      BlocProvider.of<ScreenNavigationBloc>(context).add(const UpdateActiveNavigationIconIndexEvent(
                          activeBottomNavigationIconIndex: 0
                      ));

                      BlocProvider.of<ProcessJobsBloc>(context).add(
                        SearchEvent(searchString: ""
                      ));

                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: screenWidth * ScreenConstraints().screenPaddingSides,
                      right: screenWidth * ScreenConstraints().screenPaddingSides,
                    ),
                    height: screenHeight * ScreenConstraints().buttonHeight,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: ColourScheme.mainAppTheme,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delete Job",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "NanumGothic"
                          ),
                        ),
                        Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
