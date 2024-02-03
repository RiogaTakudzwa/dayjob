import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constraints/screen_constraits.dart';
import '../../../../common/widgets/app_bar/app_bar.dart';
import '../../../../common/widgets/bottom_naviagtion_bar/navigation_bar.dart';
import '../../../../common/widgets/text/title_text.dart';
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
                // job details
                Row(
                  children: [
                    const TitleText(
                      text: "Job Title",
                    ),
                    const TitleText(
                      text: " : ",
                    ),
                    TitleText(
                      text: processJobsState.jobTitle,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const TitleText(
                      text: "Job Type",
                    ),
                    const TitleText(
                      text: " : ",
                    ),
                    TitleText(
                      text: processJobsState.jobType,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const TitleText(
                      text: "Job Number",
                    ),
                    const TitleText(
                      text: " : ",
                    ),
                    TitleText(
                      text: processJobsState.jobNumber,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const TitleText(
                      text: "Client Name",
                    ),
                    const TitleText(
                      text: " : ",
                    ),
                    TitleText(
                      text: processJobsState.clientName,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const TitleText(
                      text: "Client Address",
                    ),
                    const TitleText(
                      text: " : ",
                    ),
                    TitleText(
                      text: processJobsState.clientAddress,
                    ),
                  ],
                ),
                const SizedBox(height: 5),

              ],
            ),
          ),

          bottomNavigationBar: const CustomNavigationBar(
            screenIndexes: [0,2],
          ),
        );
      },
    );
  }
}
