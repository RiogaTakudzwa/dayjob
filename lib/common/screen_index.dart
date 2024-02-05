import 'package:dayjob/presentation/mobile/screens/create_job/widgets/create_job.dart';
import 'package:flutter/cupertino.dart';

import '../presentation/mobile/screens/home/mobile_home.dart';
import '../presentation/mobile/screens/job_details/job_details.dart';
import '../presentation/tablet/screens/home/tablet_home.dart';
import 'loading_screen.dart';


class ScreenIndex{
  List<Widget> screens = [
    const MobileHome(), // 0
    const TabletHome(), // 1

    // Mobile Screens
    const CreateJob(), // 2
    const JobDetails(), // 3

    // Loading screen
    const LoadScreen() // 4
  ];
}