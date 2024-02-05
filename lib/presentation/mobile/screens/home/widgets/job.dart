import 'package:dayjob/common/constraints/colour_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../common/constraints/screen_constraits.dart';
import '../../../../../common/widgets/text/title_text.dart';
import '../../../../../domain/navigation_bar_visibility/navigation_bar_visibility_bloc.dart';
import '../../../../../domain/process_jobs/process_jobs_bloc.dart';
import '../../../../../domain/screen_navigation/screen_navigation_bloc.dart';

class JobWidget extends StatefulWidget {
  final int jobKey;
  final String jobTitle;
  final String jobType;
  final String clientName;
  final String clientAddress;
  final String jobNumber;
  final String jobDetails;
  final String jobState;
  final String startDate;
  final String endDate;

  const JobWidget({
    super.key,
    required this.jobKey,
    required this.jobTitle,
    required this.jobType,
    required this.clientName,
    required this.clientAddress,
    required this.jobNumber,
    required this.jobDetails,
    required this.jobState,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<JobWidget> createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {

  navigationFunction(
      int activeBottomNavigationIconIndex,
      String screenTitle,
      int screenIndex,
      bool isBottomNavigationVisible
      ){

    BlocProvider.of<NavigationBarVisibilityBloc>(context).add(UpdateNavigationBarVisibilityEvent(
        visibility: isBottomNavigationVisible
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateActiveNavigationIconIndexEvent(
        activeBottomNavigationIconIndex: activeBottomNavigationIconIndex
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdatePreviousScreenIndexEvent(
        previousScreenIndex: BlocProvider.of<ScreenNavigationBloc>(context).state.screenIndex
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdatePreviousScreenTitleEvent(
        previousScreenTitle: BlocProvider.of<ScreenNavigationBloc>(context).state.screenTitle
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenTitleEvent(
        screenTitle: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenTitle
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenIndexEvent(
        index: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenIndex
    ));

  }

  void deleteJob() {
    // Delete job
    BlocProvider.of<ProcessJobsBloc>(context).add(
      DeleteJobEvent(jobKey:widget.jobKey
    ));

  }

  setActiveJob(){
    BlocProvider.of<ProcessJobsBloc>(context).add(SetActiveJobEvent(
      jobTitle: widget.jobTitle,
      jobType: widget.jobType,
      clientName: widget.clientName,
      clientAddress: widget.clientAddress,
      jobNumber: widget.jobNumber,
      jobDetails: widget.jobDetails,
      jobState: widget.jobState,
      startDate: widget.startDate,
      endDate: widget.endDate
    ));
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
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
      height: screenHeight * ScreenConstraints().buttonHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                // Navigate to details screen
                navigationFunction(1, widget.jobTitle, 3, true);
                setActiveJob();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: TitleText(
                  text: widget.jobTitle
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              deleteJob();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: ColourScheme.mainAppTheme,
            )
          )
        ],
      ),
    );
  }
}
