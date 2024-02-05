import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/navigation_bar_visibility/navigation_bar_visibility_bloc.dart';
import '../../../domain/screen_navigation/screen_navigation_bloc.dart';
import '../../constraints/screen_constraits.dart';
import 'navigation_icons.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<int> screenIndexes;

  const CustomNavigationBar({
    super.key,
    required this.screenIndexes,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  // navigationIconFunction(
  //     int activeBottomNavigationIconIndex,
  //     String screenTitle,
  //     int screenIndex,
  //     bool isBottomNavigationVisible
  // ){
  //
  //   BlocProvider.of<NavigationBarVisibilityBloc>(context).add(UpdateNavigationBarVisibilityEvent(
  //       visibility: isBottomNavigationVisible
  //   ));
  //
  //   BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateActiveNavigationIconIndexEvent(
  //       activeBottomNavigationIconIndex: activeBottomNavigationIconIndex
  //   ));
  //
  //   BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenTitleEvent(
  //       screenTitle: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenTitle
  //   ));
  //
  //   BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenIndexEvent(
  //       index: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenIndex
  //   ));
  // }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: screenWidth * ScreenConstraints().screenPaddingSides,
        right: screenWidth * ScreenConstraints().screenPaddingSides,
      ),
      width: screenWidth,
      height: screenHeight * ScreenConstraints().appBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Screen Index based off of screen_index in lib/common/screen_index
          // Mobile screen indexes increase in even increments

          // Home icon
          NavigationIcon(
            iconIndex: 0,
            onTap: (){
              BlocProvider.of<NavigationBarVisibilityBloc>(context).add(UpdateNavigationBarVisibilityEvent(
                  visibility: true
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(const UpdateActiveNavigationIconIndexEvent(
                  activeBottomNavigationIconIndex: 0
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(const UpdateScreenTitleEvent(
                  screenTitle: "Home"
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenIndexEvent(
                  index: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenIndex
              ));
            },
            icon: CupertinoIcons.home,
            screenName: "Home",
          ),

          // Create Job icon
          NavigationIcon(
            iconIndex: 1,
            onTap: (){
              BlocProvider.of<NavigationBarVisibilityBloc>(context).add(
                UpdateNavigationBarVisibilityEvent(
                  visibility: false
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(
                const UpdateActiveNavigationIconIndexEvent(
                  activeBottomNavigationIconIndex: 1
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(
                const UpdateScreenTitleEvent(
                  screenTitle: "Create New job"
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(
                const UpdateBackButtonStateEvent(
                  isBackButtonActive: true,
              ));

              BlocProvider.of<ScreenNavigationBloc>(context).add(
                UpdateScreenIndexEvent(
                  index: widget.screenIndexes[1]
              ));
            },
            icon: CupertinoIcons.add_circled,
            screenName: "Create New job",
          ),
        ],
      ),
    );
  }
}
