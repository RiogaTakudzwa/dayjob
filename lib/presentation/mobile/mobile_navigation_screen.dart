import 'package:dayjob/common/screen_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constraints/screen_constraits.dart';
import '../../domain/navigation_bar_visibility/navigation_bar_visibility_bloc.dart';
import '../../domain/screen_navigation/screen_navigation_bloc.dart';

class MobileNavigationScreen extends StatefulWidget {
  const MobileNavigationScreen({super.key});

  @override
  State<MobileNavigationScreen> createState() => _MobileNavigationScreenState();
}

class _MobileNavigationScreenState extends State<MobileNavigationScreen> {

  late int screenIndex;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      // initialize screen index
      BlocProvider.of<ScreenNavigationBloc>(context).add(const UpdateScreenIndexEvent(index: 0));

    });
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        left: screenWidth * ScreenConstraints().screenPaddingSides,
        right: screenWidth * ScreenConstraints().screenPaddingSides,
      ),
      width: screenWidth,
      height: screenHeight
        - (screenHeight * ScreenConstraints().appBarHeight)
        - (screenHeight * ScreenConstraints().bottomNavigationBarHeight),
      child: BlocBuilder<ScreenNavigationBloc, ScreenNavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                // Main body
                ScreenIndex().screens[
                  state.screenIndex
                ],
              ],
            )
          );
        }
      )
    );
  }


}
