import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/screen_navigation/screen_navigation_bloc.dart';
import '../../constraints/colour_scheme.dart';

class NavigationIcon extends StatefulWidget {
  final int iconIndex;
  final Function() onTap;
  final IconData icon;

  const NavigationIcon({
    super.key,
    required this.iconIndex,
    required this.onTap,
    required this.icon,
  });

  @override
  State<NavigationIcon> createState() => _NavigationIconState();
}

class _NavigationIconState extends State<NavigationIcon> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenNavigationBloc, ScreenNavigationState>(
      builder: (context, state) {
        return IconButton(
          onPressed: widget.onTap,
          icon: Icon(
            size: 15,
            widget.icon,
            color:
              state.activeBottomNavigationIconIndex == widget.iconIndex ?
              ColourScheme.mainAppTheme : ColourScheme.inactive,
          ),

        );
      },
    );
  }
}
