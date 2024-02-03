import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/screen_navigation/screen_navigation_bloc.dart';
import '../../constraints/screen_constraits.dart';
import '../text/title_text.dart';
import 'back_arrow.dart';

class CustomAppBar extends StatefulWidget {

  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  backButtonFunction(){
    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenIndexEvent(
      index: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenIndex
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenTitleEvent(
      screenTitle: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenTitle
    ));
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ScreenNavigationBloc, ScreenNavigationState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            left: screenWidth * ScreenConstraints().screenPaddingSides,
            right: screenWidth * ScreenConstraints().screenPaddingSides,
          ),
          height: screenHeight * ScreenConstraints().appBarHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1.0, color: Colors.black
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BackArrow(
                active: state.isBackButtonActive,
                onTap: backButtonFunction
              ), // Appbar back button
              TitleText(
                text: state.screenTitle
              ),
              Container(), // App status
               // Spacer to keep things aligned
            ],
          ),
        );
      },
    );
  }
}
