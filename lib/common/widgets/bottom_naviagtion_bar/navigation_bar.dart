import 'package:flutter/cupertino.dart';
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

  navigationIconFunction(
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

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenTitleEvent(
      screenTitle: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenTitle
    ));

    BlocProvider.of<ScreenNavigationBloc>(context).add(UpdateScreenIndexEvent(
      index: BlocProvider.of<ScreenNavigationBloc>(context).state.previousScreenIndex
    ));
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
      height: screenHeight * ScreenConstraints().appBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Screen Index based off of screen_index in lib/common/screen_index
          // Mobile screen indexes increase in even increments

          // Home icon
          NavigationIcon(
            iconIndex: 0,
            onTap: navigationIconFunction(
              widget.screenIndexes[0],
              "Home",
              widget.screenIndexes[0],
              true
            ),
            icon: CupertinoIcons.home,
          ),

          // Create Job icon
          NavigationIcon(
            iconIndex: 1,
            onTap: navigationIconFunction(
              widget.screenIndexes[1],
              "Create New Job",
              widget.screenIndexes[1],
              false
            ),
            icon: CupertinoIcons.add_circled,
          ),
        ],
      ),
    );
  }
}
