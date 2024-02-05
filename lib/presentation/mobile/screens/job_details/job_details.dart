import 'package:dayjob/common/widgets/text/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constraints/screen_constraits.dart';
import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../domain/process_jobs/process_jobs_bloc.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
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

              ],
            ),
          ),
        );
      },
    );
  }
}
